const mongoose = require('mongoose');

const ItinerarySchema = new mongoose.Schema({
    start_date: {
        type: Date,
        required: true,
    },
    end_date: {
        type: Date,
        required: true,
    },
    description: {
        type: String,
    },

});

module.exports = mongoose.model('Itinerary', ItinerarySchema);