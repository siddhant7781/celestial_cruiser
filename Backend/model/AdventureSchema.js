const mongoose = require('mongoose');
const Planet = require('./PlanetSchema')

const AdventureSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    planet_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Planet',
        required: true
    },
    duration: {
        type: Number,
        required: true,
        min: 1
    },
    price: {
        type: Number,
        required: true,
        min: 0
    },
    max_capacity: {
        type: Number,

        min: 1
    },
    start_date: {
        type: Date,

    },
    end_date: {
        type: Date,

    },
    guide: {
        type: String,

    },
    image_url: {
        type: String,

    }
});

module.exports = mongoose.model('Adventure', AdventureSchema);