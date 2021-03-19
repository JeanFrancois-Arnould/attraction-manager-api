class Incident {
    id;
    incident_number;
    nature;
    technician_assigned;
    resolution_date;

    constructor(data) {
        for (const prop in data) {
            this[prop] = data[prop];
        }
    }
}

module.exports = Incident;