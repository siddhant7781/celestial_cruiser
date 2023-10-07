const express = require('express');
const { createPlanet, getAllPlanets, getPlanet, updatePlanet, deletePlanet } = require('../controllers/planetController');
const router = express.Router();

router.get('/', getAllPlanets);
router.get('/:id', getPlanet);
router.post('/', createPlanet);
router.put('/:id', updatePlanet);
router.delete('/:id', deletePlanet);

module.exports = router;