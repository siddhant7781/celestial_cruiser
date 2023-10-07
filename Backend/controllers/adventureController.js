// adventureController.js

const express = require('express');
const Adventure = require('../model/AdventureSchema');

// Create a new adventure
const createAdventure = async (req, res) => {
    try {
        const adventure = await Adventure.create(req.body);
        res.status(201).json(adventure);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get all adventures
const getAllAdventure = async (req, res) => {
    try {
        const adventures = await Adventure.find();
        res.json(adventures);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Get a specific adventure by ID
const getAdventure = async (req, res) => {
    try {
        const adventure = await Adventure.findById(req.params.id);
        if (!adventure) {
            return res.status(404).json({ message: 'Adventure not found' });
        }
        res.json(adventure);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Update an adventure by ID
const updateAdventure = async (req, res) => {
    try {
        const adventure = await Adventure.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!adventure) {
            return res.status(404).json({ message: 'Adventure not found' });
        }
        res.json(adventure);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Delete an adventure by ID
const deleteAdventure = async (req, res) => {
    try {
        const adventure = await Adventure.findByIdAndDelete(req.params.id);
        if (!adventure) {
            return res.status(404).json({ message: 'Adventure not found' });
        }
        res.json({ message: 'Adventure deleted successfully' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = { createAdventure, getAllAdventure, getAdventure, updateAdventure, deleteAdventure };