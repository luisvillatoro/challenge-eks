require("dotenv").config()
const express = require('express')

const port = process.env.PORT || 3000
const app = express()

app.get('/', (req, res) => res.send('Hello world, challenge completed!'))

app.listen(port, () => console.log('Server Ready'))