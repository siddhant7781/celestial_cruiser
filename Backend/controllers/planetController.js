const Planet = require('../model/PlanetSchema');

const createPlanet = async (req, res) => {
    try {
        const planet = await Planet.create(req.body);
        res.status(200).json(planet);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getAllPlanets = async (req, res) => {
    try {
        const planets = await Planet.find();
        res.status(200).json(planets);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getPlanet = async (req, res) => {
    try {
        const planet = await Planet.findById(req.params.id);
        res.status(200).json(planet);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const updatePlanet = async (req, res) => {
    try {
        const { id } = req.params;
        const { name, description, image_url, distance_from_earth, temperature, atmosphere, moons, discovery_year, discoverer, facts } = req.body;

        const planet = await Planet.findByIdAndUpdate(id, { name, description, image_url, distance_from_earth, temperature, atmosphere, moons, discovery_year, discoverer, facts }, { new: true });
        if (!planet) return res.status(404).json({ message: "Planet not found" });
        res.status(200).json(planet);

    }
    catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const deletePlanet = async (req, res) => {
    try {
        const { id } = req.params;
        const planet = await Planet.findByIdAndDelete(id);
        if (!planet) return res.status(404).json({ message: "Planet not found" });
        res.status(200).json({ message: "Planet deleted successfully" });
    }
    catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = { createPlanet, getAllPlanets, getPlanet, updatePlanet, deletePlanet };