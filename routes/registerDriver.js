var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
	res.render('registerDriver', { title: 'Register driver' });
});

module.exports = router;