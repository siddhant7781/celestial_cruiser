const express = require('express');
const router = express.Router();
const Itinerary = require('../model/ItinerarySchema.js')

// Create a new itinerary
const createItinerary = async (req, res) => {
    try {
        const itinerary = await Itinerary.create(req.body);
        res.status(201).json(itinerary);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get all itineraries for a specific adventure
const getAllItinerary = async (req, res) => {
    try {
        const itineraries = await Itinerary.find({ adventure_id: req.params.adventureId });
        res.json(itineraries);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};


// Get a specific itinerary by ID
const getItinerary = async (req, res) => {
    try {
        const itinerary = await Itinerary.findById(req.params.id);
        if (!itinerary) {
            return res.status(404).json({ message: 'Itinerary not found' });
        }
        res.json(itinerary);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Update an itinerary by ID

const updateItinerary = async (req, res) => {
    try {
        const itinerary = await Itinerary.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!itinerary) {
            return res.status(404).json({ message: 'Itinerary not found' });
        }
        res.json(itinerary);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Delete an itinerary by ID
const deleteItinerary = async (req, res) => {
    try {
        const itinerary = await Itinerary.findByIdAndDelete(req.params.id);
        if (!itinerary) {
            return res.status(404).json({ message: 'Itinerary not found' });
        }
        res.json({ message: 'Itinerary deleted successfully' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get all itineraries for a specific adventure
const getAllItineraries = async (req, res) => {
    try {
        const itineraries = await Itinerary.find({ adventure_id: req.params.adventureId });
        res.json(itineraries);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = { createItinerary, getAllItinerary, getItinerary, updateItinerary, deleteItinerary, getAllItineraries };