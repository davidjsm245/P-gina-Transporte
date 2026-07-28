const express = require('express');
const router = express.Router();
const db = require('../db');
const { verifyToken } = require('../utils/auth');

//Metodo GET ÚNICO
router.get('/:id', verifyToken, (req, res) => {
    const { id } = req.params;
    //Consulta para obtener un único registro
    const query = 'select * from cliente where id_cliente = ?';
    db.query(query, [id], (err, results) => {
        if (err) {//Error en la base de datos o la consulta
            console.error(err);
            return res.status(500).json({ error: 'Error al obtener el cliente' })
        }

        if (results.length === 0) {//Si no se encuentra el cliente
            return res.status(404).json({ error: 'cliente no encontrado' })
        }
        //si se encuentra devuelve los datos
        res.json(results[0]);
    });
});

//metodo GET multiples registros
router.get('/', verifyToken, (req, res) => {
    const page = parseInt(req.query.page) || 1;//Pagina actual
    const limit = parseInt(req.query.limit) || 10;//Limite de registros por página
    const offset = (page - 1) * limit;//Punto de inicio de la consulta
    const string = req.query.string;
    let whereClause = '';
    let queryParams = [];
    if (string) {
        whereClause = 'where nombre like ? or telefono like ? or email like ?';
        const searchTerm = `%${string}%`;
        queryParams.push(searchTerm, searchTerm, searchTerm);
    }
    //consulta para obtener total de registros
    const countQuery = `select count(*) as total from cliente ${whereClause}`;
    db.query(countQuery, queryParams, (err, countResult) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Error al obtener total de cliente' });
        }
        const totalcliente = countResult[0].total;
        const totalPages = Math.ceil(totalcliente / limit);
        //consulta para obtener los registros de la página
        const clienteQuery = `select * from cliente ${whereClause} LIMIT ? OFFSET ?`;
        queryParams.push(limit, offset);
        db.query(clienteQuery, queryParams, (err, clienteResult) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error al obtener los clientes' });
            }
            //Enviar respuesta con los datos y la información de paginación
            res.json({
                totalItems: totalcliente,
                totalPage: totalPages,
                currentPage: page,
                limit: limit,
                data: clienteResult
            });
        });
    });
});

//Método get multiples registros
router.get('/', verifyToken, (req, res) => {
});
router.post('/', verifyToken, (req, res) => {
    //1ro Obtener los datos del puerto de la peticion
    const { nombre, telefono, email, direccion, tipo, estado, fecha_registro} = req.body;
    //2do Definir una consulta SQL para insertar
    const query = 'insert into cliente (nombre, telefono, email, direccion, tipo, estado, fecha_registro) values (?,?,?,?,?,?,?)';
    //3er Crear un arreglo con los valores de la consulta
    const values = [nombre, telefono, email, direccion, tipo, estado, fecha_registro]
    //4to Ejecutar la consulta
    db.query(query, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Error al guardar cliente' });
        }
        res.json({
            message: 'cliente registrado correctamente',
            id_cliente: result.insertId
        });
    });
})

//Método put
router.put('/:id', verifyToken, (req, res) => {
    //1ro Obtener el id del cliente desde parámetro de la url
    const { id } = req.params;
    //2do Obtener los datos del cuerpo de la peticion
    const { nombre, telefono, email, direccion, tipo, estado, fecha_registro} = req.body;
    //3ro Definir una consulta SQL para insertar
    const query = 'update cliente set nombre = ?, telefono = ?, email = ?, direccion = ?, tipo = ?, estado = ?, fecha_registro = ? where id_cliente = ?';
    //4to Crear un arreglo con los valores de la consulta
    const values = [nombre, telefono, email, direccion, tipo, estado, fecha_registro, id]
    //5to Ejecutar la consulta
    db.query(query, values, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Error al actualizar cliente' });
        }
        res.json({
            message: 'cliente actualizado correctamente',
            id_cliente: id
        });
    });
});

//Método delete con verificación completa de dependencias
router.delete('/:id', verifyToken, (req, res) => {

    const { id } = req.params;

    // 1. Contar registros dependientes
    const countQuery = `
        SELECT 
            (SELECT COUNT(*) 
             FROM envio 
             WHERE id_cliente = ?) AS total_envios,

            (SELECT COUNT(*) 
             FROM entrega 
             WHERE id_envio IN (
                SELECT id_envio 
                FROM envio 
                WHERE id_cliente = ?
             )) AS total_entregas
    `;

    db.query(countQuery, [id, id], (err, results) => {

        if (err) {
            console.error(err);

            return res.status(500).json({
                error: 'Error interno del servidor'
            });
        }

        const { total_envios, total_entregas } = results[0];

        // Validar registros relacionados
        if (total_envios > 0 || total_entregas > 0) {

            return res.status(409).json({
                message: 'El cliente tiene registros dependientes, no se puede eliminar',
                total_envios,
                total_entregas
            });

        }

        // 2. Verificar si el cliente existe
        const getClienteQuery = `
            SELECT id_cliente 
            FROM cliente 
            WHERE id_cliente = ?
        `;

        db.query(getClienteQuery, [id], (err, results) => {

            if (err) {
                console.error(err);

                return res.status(500).json({
                    error: 'Error interno del servidor'
                });
            }

            if (results.length === 0) {

                return res.status(404).json({
                    message: 'Cliente no encontrado'
                });

            }

            // 3. Eliminar cliente
            const deleteCliente = `
                DELETE FROM cliente 
                WHERE id_cliente = ?
            `;

            db.query(deleteCliente, [id], (err) => {

                if (err) {
                    console.error(err);

                    return res.status(500).json({
                        error: 'Error al eliminar el cliente'
                    });
                }

                res.status(200).json({
                    message: 'Cliente eliminado con éxito',
                    id_cliente: id
                });

            });

        });

    });

});

module.exports = router;