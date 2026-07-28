
const express = require("express");
const router = express.Router();
const db = require("../db");
const { verifyToken } = require("../utils/auth");
//con la contraseña encritado
const bcrypt = require("bcrypt");

//metodo get unico para obtener los datos de la empresa

router.get("/:id", verifyToken, (req, res) => {
  const { id } = req.params; //obtener el id de la empresa desde los parametros de la ruta

  //consult para obtener un unico registro de la empresa
  const query = "SELECT * FROM almacen WHERE id_almacen = ?";
  db.query(query, [id], (err, results) => {
    if (err) {
      //error en la bdd de datos o en la consulta
      console.error("Error al obtener los datos del almacén:", err);
      return res
        .status(500)
        .json({ error: "Error al obtener los datos del almacén" });
    }

    if (results.length === 0) {
      //si no se encuentra el almacén , enviar un mensaje de error
      return res.status(404).json({ message: "Almacén no encontrado" });
    }
    //si se encuentra la empresa , enviar los datos de la empresa como respuesta
    res.json(results[0]);
  });
});

// METODO GET MULTIPLE PARA OBTENER LOS DATOS DE TODAS LAS EMPRESAS
router.get("/", verifyToken, (req, res) => {
  const page = parseInt(req.query.page) || 1; //pagina actual , por defecto es 1
  const limit = parseInt(req.query.limit) || 10; //cantidad de registros por pagina , por defecto es 10
  const offset = (page - 1) * limit; //punto de partida para la consulta

  const string = req.query.string;
  let whereClause = "";
  let queryParams = [];

  if (string) {
    whereClause = "where nombre like ? or ciudad like ? or estado like ?";
    const searchTerm = `%${string}%`;
    queryParams.push(searchTerm, searchTerm, searchTerm);
  }

  //consulta para obtener total de registros
  const countQuery = `select count(*) as total from almacen ${whereClause}`;
  db.query(countQuery, queryParams, (err, countResult) => {
    if (err) {
      console.error(err);
      return res
        .status(500)
        .json({ error: "Error al obtener total de almacenes" });
    }

    const totalAlmacenes = countResult[0].total;
    const totalPages = Math.ceil(totalAlmacenes / limit);

    //consulta para obtener los registros de la página
    //const almacenQuery = `select * from almacen ${whereClause} LIMIT ? OFFSET ?`;

    const almacenQuery = `
  SELECT 
    a.id_almacen, 
    a.nombre, 
    a.direccion, 
    a.ciudad, 
    a.capacidad_m3, 
    a.id_empresa, 
    a.estado, 
    a.fecha_registro, 
    e.nombre AS nombre_empresa
  FROM almacen a
  INNER JOIN empresa e ON a.id_empresa = e.id_empresa
  ${whereClause} 
  LIMIT ? OFFSET ?`;


    queryParams.push(limit, offset);
    db.query(almacenQuery, queryParams, (err, almacenesResult) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error al obtener las empresas" });
      }

      //Enviar respuesta con los datos y la información de paginación
      res.json({
        totalItems: totalAlmacenes,
        totalPage: totalPages,
        currentPage: page,
        limit: limit,
        data: almacenesResult,
      });
    });
  });
});

//---------------------
// Método POST para crear un almacén
router.post("/", verifyToken, (req, res) => {
  const {
    nombre,
    direccion,
    ciudad,
    capacidad_m3,
    id_empresa,
    estado,
    fecha_registro,
  } = req.body;

  const query =
    "INSERT INTO almacen ( nombre, direccion, ciudad, capacidad_m3, id_empresa, estado, fecha_registro) VALUES ( ?, ?, ?, ?, ?, ?, ?);";
  const values = [
    nombre,
    direccion,
    ciudad,
    capacidad_m3,
    id_empresa,
    estado,
    fecha_registro,
  ];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error al insertar el almacén" });
    }
    res.status(201).json({
      message: "Almacén registrado correctamente",
      id_almacen: result.insertId,
    });
  });
});

// MÉTODO PUT para actualizar un almacén
router.put("/:id", verifyToken, (req, res) => {
  const { id } = req.params;

  const {
    nombre,
    direccion,
    ciudad,
    capacidad_m3,
    id_empresa,
    estado,
    fecha_registro,
  } = req.body;

  const query = `
        UPDATE almacen 
        SET nombre = ?, direccion = ?, ciudad = ?, capacidad_m3 = ?, id_empresa = ?, estado = ?, fecha_registro = ? 
        WHERE id_almacen = ?;
        `;
  const values = [
    nombre,
    direccion,
    ciudad,
    capacidad_m3,
    id_empresa,
    estado,
    fecha_registro,
    id,
  ];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error al actualizar el almacén" });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Almacén no encontrado" });
    }
    res.status(200).json({
      message: "Almacén actualizado correctamente",
    });
  });
});

//--------->
router.delete("/:id", verifyToken, async (req, res) => {
  const idAlmacen = req.params.id;
  //const idEmpresa = req.user.id_empresa;
  const contar_query =
    "SELECT COUNT(*) as contador FROM entrega WHERE id_almacen_origen = ?";
  db.query(contar_query, [idAlmacen], (err, contar_result) => {
    if (err) {
      console.error(err);
      return res
        .status(500)
        .json({ error: "Error al verificar entregas del almacén" });
    }

    if (contar_result[0].contador > 0) {
      return res.status(409).json({
        error:
          "El almacén no se puede eliminar porque tiene entregas vinculadas",
      });
    }

    const query = "DELETE FROM almacen WHERE id_almacen = ?";
    db.query(query, [idAlmacen], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error al eliminar almacén" });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Almacén no encontrado" });
      }
      res.status(200).json({ message: "Almacén eliminado correctamente" });
    });
  });
});

//
module.exports = router;