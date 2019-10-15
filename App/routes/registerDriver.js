var express = require('express');
var router = express.Router();

const {Pool} = require('pg');

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

router.get('/', function(req, res, next) {
	res.render('registerDriver', { title: 'Register driver' });
});

/* SQL Query */
var sql_query1 = 'INSERT INTO Car VALUES';
var sql_query2 = 'INSERT INTO Drives VALUES';
var sql_query3 = 'INSERT INTO Verify VALUES';
var sql_query4 = 'INSERT INTO Driver VALUES';

// POST
router.post('/', function(req, res, next) {
	// Retrieve Information
	var plateNumber  = req.body.plateNumber;
	var model    = req.body.model;
	var capacity = req.body.capacity;
	
	// Construct Specific SQL Query
	var insert_query = sql_query1 + "('" + plateNumber + "','" + model + "','" + capacity + "');";
	insert_query = insert_query + "\n";
	
	// insert_query = insert_query + sql_query2 + "('" + username + "','" + plateNumber + "');";
	insert_query = insert_query + "\n";

	// insert_query = insert_query + sql_query3 + "('Z','" + username + "');";
	insert_query = insert_query + "\n";

	// insert_query = insert_query + sql_query4 + "('" + username + "','" + name + "');";
	insert_query = insert_query + "\n";

	pool.query(insert_query, (err, data) => {
		res.redirect('/select')
	});
});
module.exports = router;