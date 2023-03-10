const http = require('http');
const fs = require('fs');
const path = require('path');
const mysql = require('mysql');

const hostname = '127.0.0.1';
const port = 3000;

const connection = mysql.createConnection({
	// host: 'host',
	// user: 'user',
	// password: 'password',
	// database: 'database'
	host: process.env.DB_HOST,
	user: process.env.DB_USER,
	password: process.env.DB_PASS,
	database: process.env.DB_NAME
});

connection.connect((err) => {
	if (err) {
		console.error('Error connecting to database: ' + err.stack);
		return;
	}
	console.log('Connected to database with id ' + connection.threadId);
});

const query = 'SELECT * FROM topic';
connection.query(query, (error, results, fields) => {
	if (err) throw err;

	const data = [];
	for(let i = 0; i < results.length; i++){
		data.push(results[i]);
	}

	const topicNames = document.querySelectorAll('#topic_name');
	topicNames.forEach((topicName, index) => {
		topicName.innerHTML = data[index].name;
	});
})

connection.query('SELECT * FROM topic', (error, results, fields) => {
	if (error) {
		console.error('Error executing query: ' + error.stack);
		return;
	}
	console.log('Query results:', results);


});

const server = http.createServer((req, res) => {
	console.log(`Request for ${req.url} method ${req.method}`);

	if (req.method === 'GET') {
		let filePath = '.' + req.url;
		if (filePath === './') {
			filePath = './index.html';
		}
		const extname = path.extname(filePath);
		let contentType = 'text/html';
		switch (extname) {
		case '.js':
			contentType = 'text/javascript';
			break;
		case '.css':
			contentType = 'text/css';
			break;
		case '.json':
			contentType = 'application/json';
			break;
		case '.png':
			contentType = 'image/png';
			break;
		case '.jpg':
			contentType = 'image/jpg';
			break;
		case '.wav':
			contentType = 'audio/wav';
			break;
		}

		fs.readFile(filePath, (err, content) => {
		if (err) {
			if (err.code == 'ENOENT') {
				res.writeHead(404);
				res.end('File not found');
			} else {
				res.writeHead(500);
				res.end('Internal server error');
			}
		} else {
			res.writeHead(200, { 'Content-Type': contentType });
			res.end(content, 'utf-8');
		}
		});
	} else {
		res.writeHead(405);
		res.end('Method not allowed');
	}
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
