const express = require("express")
const bodyParser = require("body-parser")
const moongoose = require("mongoose")
const dotenv = require('dotenv')
const cors = require('cors')
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const app = express();
dotenv.config();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

// Connect to DB
moongoose.connect(process.env.MONGODB_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => {
    console.log("Connected to DB")
}).catch(err => {
    console.log("Error: ", err.message)
});

//routes
app.use("/api/users", require('./routes/userRoute.js'));
app.use("/api/planets", require('./routes/planetRoute.js'));
app.use("/api/adventures", require('./routes/adventureRoute.js'));
app.use("/api/itineraries", require('./routes/itineraryRoute.js'));




// Start server
const server = app.listen(3000, () => {
    console.log("server is running on port 3000")
})

