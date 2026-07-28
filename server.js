const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Importación de rutas
const authRoutes = require('./routes/auth');
const clienteRoutes = require('./routes/cliente');
const empresaRoutes = require('./routes/empresa');
const almacenRoutes = require('./routes/almacen');

// Usar rutas
app.use('/api/auth', authRoutes);
app.use('/api/cliente', clienteRoutes);
app.use('/api/empresa', empresaRoutes);
app.use('/api/almacen', almacenRoutes);

// Ruta de ejemplo
app.get('/', (req, res) => {
    res.send('Hola desde el servidor express!');
});

// Iniciar servidor
app.listen(port, () => {
    console.log(`Servidor corriendo en el puerto ${port}`);
});