const incidentsMapper = require('../models/incidentsMapper')
const Incident = require('../models/incidents')
const pug = require('pug');

const incidentsController = {

    /**
     * @param {Express.Response} res
     * @async
     */
    showIncidents: async (req, res) => {
        const incidents = await incidentsMapper.findAll();
        // renvoie la vue index pug
        res.render('index', { incidents })
    },

    oneIncident: async (req, res) => {
        const { id } = req.params
        try {
            const incident = await incidentsMapper.findOne(id);
            // renvoie la vue index pug
            res.render('modify', { incident });
        } catch (err) {
            res.status(404).json(err.message)
        }
    },
    del: async (req,res) => {
        console.log(req);
        const { id } = req.params
        console.log("controller",id);
        try {
            await incidentsMapper.deleteOne(id);
            await res.redirect('/maintenance/');
        } catch (err) {
            res.status(404).json(err.message)
        }
    },
    newPost: async (req, res) => {
        const theIncident = req.body;

        // pas de retour postMapper intervient directement sur son parametre l'objet est passer par reference
        try {
            await incidentsMapper.save(theIncident);
            await res.redirect('/maintenance/')
        } catch (error) {
            res.status(403).json(error.message);
        };
    },
    newTicket: async (req, res) => {
        
        try {
            const attraction = await incidentsMapper.allAttraction();
            
            res.render('create', { ticket: "un nouveau ticket", attraction });
        } catch (error) {
            res.status(403).send(error.message);
        };
    },
    createTicket: async (req,res) => {
        const { body } = req
        if ((body.attraction_id || body.name || body.technicien) === ""){
            res.render('forbidden', {message: "veuillez remplir tout les champs et arrêtez de modifier le html petit malin 😉 "})
        }
        await incidentsMapper.addIncident(body);
        res.redirect('/maintenance/');
    }
};

module.exports = incidentsController;