const mongoose = require('mongoose');

const PlanetSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    image_url: {
        type: String,
    },
    distance_from_earth: {
        type: Number,
    },
    temperature: {
        type: Number,
    },
    atmosphere: {
        type: String,
    },
    moons: {
        type: [String],
    },
    discovery_year: {
        type: Number,
        min: 0
    },
    discoverer: {
        type: String,
    },
    facts: {
        type: [String],
    }
});

module.exports = mongoose.model('Planet', PlanetSchema);

