const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createConnection({
    host: process.env.MYSQLHOST || 'localhost',
    user: process.env.MYSQLUSER || 'root',
    password: process.env.MYSQLPASSWORD || '',
    database: process.env.MYSQLDATABASE || 'railway', // En tu local pon el nombre de tu bd local
    port: process.env.MYSQLPORT || 3306
});

db.connect((err) => {
    if (err) {
        console.log('Error al conectar con la base de datos: ', err);
        return;
    }
    console.log('Conexión exitosa con la base de datos');
});

module.exports = db;