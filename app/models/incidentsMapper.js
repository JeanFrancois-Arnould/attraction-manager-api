const Incident = require('./incidents');
const db = require('../database');

const incidentsMapper = {

    findAll: async () => {
        const result = await db.query(` SELECT *
        FROM incident;`);
        return result.rows.map(incident => new Incident(incident));
    },

    findOne: async (id) => {
        const result = await db.query(` SELECT incident.id, nature, incident_number,public_name, technician_assigned FROM incident
        JOIN attraction ON incident.attraction_id = attraction.id
        WHERE incident.id = $1;`, [id]);
        if (!result.rows[0]) {
            throw new Error(`pas d'incident id ${id}`)
        }
        return result.rows.map(incident => new Incident(incident));
    },

    deleteOne: async (id) => {
        console.log("mapper",id);
        return await db.query(`
        DELETE FROM incident
        WHERE id = $1;`, [id]);

    },

    save: async (theIncident) => {
        const data =[theIncident.title,theIncident.technicien,theIncident.resolutionDate, theIncident.id]

        let query = ` 
        UPDATE incident set  
        nature = $1, 
        technician_assigned = $2, 
        resolution_date = $3 
        WHERE incident.id = $4;`;

        try {
            await db.query(query, data);

        } catch (error) {
            throw new Error(error)
        };
    },
    allAttraction: async () => {
        const result = await db.query(` SELECT *
        FROM attraction;`);
        return result.rows
    },

    addIncident:async (callback) => {
        const incident_number = await incidentsMapper.random(1,9999);
        // const number = new Set();
        try {
            await db.query(`
        INSERT INTO incident (incident_number, nature, technician_assigned, attraction_id)
        VALUES ($1,$2,$3,$4);`, [incident_number, callback.nature, callback.technicien_assigned, callback.attraction_id])
        } catch (error) {
            throw new Error(error)
        } 
    },
    random: (min,max) => Math.floor(Math.random() * (max - min + 1)) + min
};

module.exports = incidentsMapper;