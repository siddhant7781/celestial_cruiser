const express = require('express');
const { createAdventure, getAllAdventure, getAdventure, updateAdventure, deleteAdventure } = require('../controllers/adventureController');
const router = express.Router();

router.get('/', getAllAdventure);
router.post('/', createAdventure);
router.get('/:id', getAdventure);
router.put('/:id', updateAdventure);
router.delete('/:id', deleteAdventure);

module.exports = router;