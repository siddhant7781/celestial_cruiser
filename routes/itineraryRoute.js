const express = require('express');
const { createItinerary, getAllItinerary, getItinerary, updateItinerary, deleteItinerary, getAllItineraries } = require('../controllers/itineraryController');
const router = express.Router();

router.get('/', getAllItinerary);
router.post('/', createItinerary);
router.get('/:id', getItinerary);
router.put('/:id', updateItinerary);
router.delete('/:id', deleteItinerary);

router.get('/adventures/adventureId', getAllItineraries)

module.exports = router;
