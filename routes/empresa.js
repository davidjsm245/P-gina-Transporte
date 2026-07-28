const express = require('express');
const router = express.Router();
const db = require('../db');
const { verifyToken } = require('../utils/auth');
const bcrypt = require('bcrypt');



//metodo get unico para obtener los datos de la empresa 

router.get('/:id', verifyToken, (req, res) => {
    const { id } = req.params;  //obtener el id de la empresa desde los parametros de la ruta


    //consult para obtener un unico registro de la empresa

    const query = 'SELECT * FROM empresa WHERE id_empresa = ?';
    db.query(query, [id], (err, results) => {
        if (err) { //error en la bdd de datos o en la consulta
            console.error('Error al obtener los datos de la empresa:', err);
            return res.status(500).json({ error: 'Error al obtener los datos de la empresa' });
        }
        if (results.length === 0) { //si no se encuentra la empresa , enviar un mensaje de error
            return res.status(404).json({ message: 'Empresa no encontrada' });

        }
        //si se encuentra la empresa , enviar los datos de la empresa como respuesta
        res.json(results[0]);

    });

});
// METODO GET MULTIPLE PARA OBTENER LOS DATOS DE TODAS LAS EMPRESAS
router.get('/', verifyToken, (req, res) => {
    const page = parseInt(req.query.page) || 1; //pagina actual , por defecto es 1 
    const limit = parseInt(req.query.limit) || 10; //cantidad de registros por pagina , por defecto es 10
    const offset = (page - 1) * limit; //punto de partida para la consulta

    const string = req.query.string;
    let whereClause = '';
    let queryParams = [];
    if (string) {
        whereClause = 'where nombre like ? or telefono like ? or email like ?';
        const searchTerm = `%${string}%`;
        queryParams.push(searchTerm, searchTerm, searchTerm);
    }
    //consulta para obtener total de registros
    const countQuery = `select count(*) as total from empresa ${whereClause}`;
    db.query(countQuery, queryParams, (err, countResult) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Error al obtener total de empresas' });
        }
        const totalEmpresas = countResult[0].total;
        const totalPages = Math.ceil(totalEmpresas / limit);
        //consulta para obtener los registros de la página
        const empresasQuery = `select * from empresa ${whereClause} LIMIT ? OFFSET ?`;
        queryParams.push(limit, offset);
        db.query(empresasQuery, queryParams, (err, empresasResult) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener las empresas' });
            }
            //Enviar respuesta con los datos y la información de paginación
            res.json({
                totalItems: totalEmpresas,
                totalPage: totalPages,
                currentPage: page,
                limit: limit,
                data: empresasResult
            });
        });
    });

});


/*
//metodo post para crear una nueva empresa

router.post('/' , verifyToken , (req, res)=> {
    // 1 obtener los datos del cuerpo de la peticion 
    const {nombre, telefono, email, password , direccion , tipo , estado, fecha_registro} = req.body;

    //2 deffinir una consult sql para insertar
    
    const query = 'INSERT INTO empresa (nombre, telefono, email, password , direccion , tipo , estado, fecha_registro) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';

    //3 crear un arreglo con los valores de la consulta
    const values = [nombre, telefono, email, password , direccion , tipo , estado, fecha_registro];

    //4 Ejecutar la consulta y manejar la respuesta

     db.query(query, values, (err, result) => {
            if (err) {
                console.error('Error al crear la empresa:', err);
                return res.status(500).json({ error: 'Error al guardar la empresa'});
            }
            
            res.status(201).json({
                message: 'Empresa registrada exitosamente',
                id_empresa: result.insertId
            });
        });

    

});



*/


//metodo post para crear una nueva empresa

router.post('/', verifyToken, async (req, res) => {





    // 1 obtener los datos del cuerpo de la peticion 
    const { nombre, telefono, email, password, direccion, tipo, estado, fecha_registro } = req.body;

    try {

        //encriptar la contraseña antes de guardarla en la base de datos

        const clave_hasheada = await bcrypt.hash(password, 12); //encriptar la contraseña con un salt de 12 rondas

        





        //2 deffinir una consult sql para insertar

        const query = 'INSERT INTO empresa (nombre, telefono, email, password , direccion , tipo , estado, fecha_registro) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';

        //3 crear un arreglo con los valores de la consulta
        const values = [nombre, telefono, email, clave_hasheada, direccion, tipo, estado, fecha_registro];

        //4 Ejecutar la consulta y manejar la respuesta

        db.query(query, values, (err, result) => {
            if (err) {
                console.error('Error al crear la empresa:', err);
                return res.status(500).json({ error: 'Error al guardar la empresa' });
            }

            res.status(201).json({
                message: 'Empresa registrada exitosamente',
                id_empresa: result.insertId
            });
        });


    } catch (error) {

        res.status(500).json({ error: 'Error de encriptación de contraseña' });


    }



});


//metodo put para actualizar los datos de una empresa

router.put('/:id', verifyToken, (req, res) => {

    const { id } = req.params; //obtener el id de la empresa desde los parametros de la ruta

    const { nombre, telefono, email, password, direccion, tipo, estado } = req.body; //obtener los datos del cuerpo de la peticion 
    //definir la consulta sql para actualizar los datos de la empresa

    const query = 'UPDATE empresa SET nombre = ?, telefono = ?, email = ?, password = ?, direccion = ?, tipo = ?, estado = ? WHERE id_empresa = ?';
    //crear un arreglo con los valores de la consulta

    const values = [nombre, telefono, email, password, direccion, tipo, estado, id];

    //ejecutar la consulta y manejar la respuesta
    db.query(query, values, (err, result) => {
        if (err) {
            console.error('Error al actualizar la empresa:', err);
            return res.status(500).json({ error: 'Error al actualizar la empresa', id_empresa: id });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Empresa no encontrada' });
        }
        res.json({ message: 'Empresa actualizada exitosamente', id_empresa: id });
    });
});

/*
router.delete('/:id' , verifyToken , (req, res) => {
    const {id} = req.params; //obtener el id de la empresa desde los parametros de la ruta
    //contar registros dependientes de la empresa
    const contar_query = 'SELECT COUNT(*) AS total FROM token_usuarios WHERE id_empresa = ?';




    //definir la consulta sql para eliminar la empresa
    const query = 'DELETE FROM empresa WHERE id_empresa = ?';
    //ejecutar la consulta y manejar la respuesta
    db.query(query, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar la empresa:', err);
            return res.status(500).json({ error: 'Error al eliminar la empresa' , id_empresa: id });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Empresa no encontrada' });
        }
        res.status(200).json({
             message: 'Empresa eliminada exitosamente', 
             id_empresa: id 
            });

    });
});
*/


//metodo delete para eliminar una empresa

router.delete('/:id', verifyToken, async (req, res) => {
    const { id } = req.params;

    try {
        // Verificar dependencias en TODAS las tablas que tienen id_empresa
        const checks = [
            { table: 'conductor', col: 'id_empresa', label: 'conductores' },
            { table: 'vehiculo', col: 'id_empresa', label: 'vehículos' },
            { table: 'almacen', col: 'id_empresa', label: 'almacenes' },
            { table: 'ruta', col: 'id_empresa', label: 'rutas' },
        ];

        for (const check of checks) {
            const search_query = `SELECT COUNT(*) AS contador FROM ${check.table} WHERE ${check.col} = ?`;

            const result = await new Promise((resolve, reject) => {
                db.query(search_query, [id], (err, result) => {
                    if (err) reject(err);
                    else resolve(result);
                });
            });

            if (result[0].contador > 0) {
                return res.status(409).json({
                    error: `No se puede eliminar la empresa porque tiene ${check.label} registrados`
                });
            }
        }

        // Si no hay dependencias, eliminar la empresa
        const deleteQuery = 'DELETE FROM empresa WHERE id_empresa = ?';

        const deleteResult = await new Promise((resolve, reject) => {
            db.query(deleteQuery, [id], (err, result) => {
                if (err) reject(err);
                else resolve(result);
            });
        });

        if (deleteResult.affectedRows === 0) {
            return res.status(404).json({ error: 'Empresa no encontrada' });
        }

        res.status(200).json({ message: 'Empresa eliminada exitosamente' });

    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

module.exports = router;