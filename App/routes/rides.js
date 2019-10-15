var express = require('express');
var router = express.Router();
//const { Pool } = require('pg')

/*
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});
*/

/* SQL Query 
var sql_query = 'Select * FROM Verify WHERE Verify.uname = @user_id';
*/

/* TEMP FOR SEEING OUTPUT */
router.get('/', function(req, res, next) {
  res.render('rides', { title: 'Find your ride ride now' });
});

module.exports = router;