var express = require('express');
var router = express.Router();


/* Awaiting approval page */
router.get('/', function(req, res, next) {
  res.render('awaitingApproval', { title: 'Patience is key' });
});

module.exports = router;