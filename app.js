var cluster = require('cluster');
var nap = require('nap');
var nodemailer = require('nodemailer');
var fs = require('fs');
// email config


if (cluster.isMaster) {

  var cpuCount = require('os').cpus().length;
  if (cpuCount > 3) {
    cpuCount = 3;
  }

  // Create a worker for each CPU
  for (var i = 0; i < cpuCount; i += 1) {
      cluster.fork();
  }

  cluster.on('disconnect', function(worker) {
    console.error('disconnect!');
    cluster.fork();
  });

} else {

  /**
   * Module dependencies.
   */

  var express = require('express');
  var routes = require('./routes');
  var http = require('http');
  var path = require('path');
  var less = require('less');
  var domain = require('domain');
  var coffee = require('coffee-script');
  var partials = require('express-partials');

  var app = express();


  nap.preprocessors['.coffee'] = function(contents) { return coffee.compile(contents); };
  //nap.preprocessors['.less'] = function(contents) {
  //  less.render(contents, function(e, output) { contents = output });
  //  return contents
  //};


  // nap config
  var napConfig = {
    publicDir: 'public',
    assets: {
      js: {
        deps: [
          '/public/javascripts/jquery.min.js',
        ],
        all: [
          '/public/javascripts/jquery.tipsy.js',
          '/public/javascripts/scrollspy.js',
          '/public/javascripts/d3.js',
          '/public/javascripts/underscore.js',
          '/public/javascripts/backbone.js',
          '/public/javascripts/ejs.js',
          '/public/javascripts/skrollr.js',
          '/public/javascripts/pubsub.js',
          '/public/javascripts/nprogress.js',
          '/public/javascripts/detention.coffee',
          '/public/javascripts/models/*.coffee',
          '/public/javascripts/collections/*.coffee',
          '/public/javascripts/routers/*.coffee',
          '/public/javascripts/views/module.coffee',
          '/public/javascripts/views/**/*.coffee',
          '/public/javascripts/figures/*.coffee',
        ]
      },
      css: {
        all: [
          '/public/stylesheets/bootstrap.css',
          '/public/stylesheets/nprogress.css',
          '/public/stylesheets/tipsy.css',
          '/public/stylesheets/style.less'
        ]
      },
    }
  };

  if (app.get('env') === 'production') {
    napConfig.minify = true;
    napConfig.mode = 'production';
    napConfig.uglifyOpts = { mangle: false };
  }

  nap(napConfig);

  app.locals.nap = nap;

  // all environments
  app.engine('hamlc', require('haml-coffee').__express);
  app.set('port', 3334);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'hamlc');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(partials());
  app.use(app.router);
  app.use(require('less-middleware')(path.join(__dirname, 'public')));
  app.use(express.static(path.join(__dirname, 'public')));

  // development only
  if ('development' == app.get('env')) {
    app.use(express.errorHandler());
  }

  app.get('/', routes.index);

  if ('development' === app.get('env')) {
    http.createServer(app).listen(app.get('port'), function(){
      console.log('Express server listening on port ' + app.get('port'));
    });
  } else if ('production' === app.get('env')) {
    nap.package(function() {
      http.createServer(app).listen(app.get('port'), function(){
        console.log("Express server listening on port " + app.get('port'));
      });
    });
  }
}
