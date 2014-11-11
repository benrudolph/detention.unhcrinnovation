var constants = require('../lib/constants');
/*
 * GET home page.
 */


exports.index = function(req, res){
  res.render('index', { layout: true });
};
