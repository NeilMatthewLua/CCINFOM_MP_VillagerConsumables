const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql')

const app = express()
const port = 8000

const {home} = require('./routes/index')
const signIn = require('./routes/signIn')

// const studentRoute = require('./routes/studentRoute');


const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'p@ssword',
    database: 'villagebayanihan',
    port: 3307
})

db.connect(err =>{
    if (err){
        throw err;
    }
    console.log('DB Connected!')
})

global.db = db

app.set('port', process.env.port || port)
app.set('view engine', 'ejs')
app.set('views', __dirname + '/views')

app.use(bodyParser.urlencoded({ extended : true }))
app.use(bodyParser.json())

app.get('/', home);
app.get('/signIn', signIn.signIn);
// app.get('/add', studentRoute.addStudent);
app.post('/signIn', signIn.validation)
// app.get('/edit/:id', updateStudentPage);
// app.get('/delete/:id', deleteStudent);

// app.post('/add', createStudent);
// app.post('/edit/:id', updateStudent);

app.listen(port, () =>{
    console.log('Port Connected!')
    console.log(`Link: http://localhost:${port}`)
})