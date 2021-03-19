
require('dotenv').config({path: (__dirname,'./.env')});
const express = require('express');
const router = require('./app/router');
const expressSession = require('express-session');
const PORT = process.env.PORT || 5000;
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.set('views', __dirname + '/integration'); 
app.set('view engine', 'pug');
app.use(expressSession({
resave: true,
saveUninitialized: true,
secret: 'Guess it!',
cookie: {
secure: false,
maxAge: 1000 * 60 * 60, // ça fait une heure
}
})
);
app.use('/maintenance',router);
app.use(express.static('static')); // servir les fichiers statiques qui sont dans 'integration'
app.listen(PORT, () => {
console.log(`Listening on port ${PORT}`);// on lance le serveur
});



