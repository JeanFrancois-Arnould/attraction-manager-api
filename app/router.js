const express = require('express');
const router = express.Router();

const incidentsController = require('./controllers/incidentsController');
const { validateBody } = require('./services/validator');
const incidentSchema = require('./schemas/incidentSchema');

router.get('/', incidentsController.showIncidents);
router.get('/incident/:id', incidentsController.oneIncident);
router.get('/incident-del/:id',incidentsController.del);
router.get('/new-incident', incidentsController.newTicket);


router.post('/incident/:id', incidentsController.newPost);
router.post('/new-incident', validateBody(incidentSchema), incidentsController.createTicket);


module.exports = router;