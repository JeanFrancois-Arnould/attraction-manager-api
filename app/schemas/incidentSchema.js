const Joi = require('joi').extend(require('@joi/date'));

const incidentSchema = Joi.object({
        incident_number: Joi.number(),
        nature: Joi.string().required(),
        technicien_assigned: Joi.string().required(),
        attraction_id: Joi.number().required(),
        resoltion_date: Joi.date().format('YYYY-MM-DD').utc()
    });

module.exports = incidentSchema;