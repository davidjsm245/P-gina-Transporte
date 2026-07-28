
const express = require("express");
const router = express.Router();
const db = require("../db");
const bcrypt = require("bcrypt");
const { generateToken } = require("../utils/auth");

//Funcion de autenticacion
router.post("/login", (req, res) => {
  const { email, password } = req.body;

  ///Buscar el usuario en la base de datos 'BDD'
  db.query(
    "select * from  empresa where email = ?",
    [email],
    async (err, results) => {
      if (err) throw err;
      if (results.length === 0) {
        return res
          .status(401)
          .json({ message: "Usuario o contraseña incorrectos" });
      }
      const user = results[0];

      ////Comparar la contraseña encriptada
      const isPasswordValid = await bcrypt.compare(password, user.password);
      if (!isPasswordValid) {
        return res
          .status(401)
          .json({ message: "Usuario o contraseña incorrectos" });
      }

      // Si la contraseña es valida , genera un token y lo envia
      const token = generateToken({ id: user.id_empresa, email: user.email });
      res.json({
        message: "logueo exitoso",
        idusuarioEmpresa: user.id_empresa,
        token,
      });
    },
  );
});

module.exports = router;

/*const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcrypt');
const { generateToken } = require('../utils/auth');

//Función de autenticación
router.post('/login', (req, res) => {
    const { email, password } = req.body;

    //buscar el usuario en la BDD
    db.query('SELECT * FROM cliente WHERE id_cliente = ?', [cedula], async (err, results) => {
        if(err) throw err;
        if (results.length === 0){
            return res.status(401).json({ message: 'Usuario o contraseña inválidas' });
        }
        const user = results[0];

        //Comparar la contraseña encriptada
        const isPasswordValid = await bcrypt.compare(password, user.password);
        if(!isPasswordValid) {
            return res.status(401).json({ message: 'Usuario o contraseña inválidas' });
        }

        //Si la contraseña es válida, genera un token y lo envía
        const token = generateToken({id: user.idusuario, cedula: user.cedula});
        res.json({ message: 'Inicio de sesión exitoso', idusuario: user.idusuario, token});

    });
})

module.exports = router;
*/