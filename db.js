const mysql = require('mysql2');
require('dotenv').config();

console.log('DB CONFIG →', {
    host: process.env.MYSQLHOST,
    port: process.env.MYSQLPORT,
    database: process.env.MYSQLDATABASE,
    user: process.env.MYSQLUSER
});

const pool = mysql.createPool({
    host: process.env.MYSQLHOST || 'localhost',
    user: process.env.MYSQLUSER || 'root',
    password: process.env.MYSQLPASSWORD || '', // en local pon tu password local si tienes
    database: process.env.MYSQLDATABASE || 'railway',
    port: process.env.MYSQLPORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Verificación inicial opcional, solo para confirmar que la config es correcta al arrancar
pool.getConnection((err, connection) => {
    if (err) {
        console.log('Error al conectar con la base de datos: ', err);
        return;
    }
    console.log('Conexión exitosa con la base de datos');
    connection.release(); // IMPORTANTE: liberar la conexión de prueba de vuelta al pool
});

module.exports = pool;