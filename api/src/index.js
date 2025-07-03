const express = require('express');
const cors = require('cors');
const app = express();

// enable CORS and JSON payload parsing
app.use(cors());
app.use(express.json());

// health check
app.get('/ping', (req, res) => {
  res.send('pong');
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log('API listening on port ' + PORT);
});
