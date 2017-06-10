var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var jade = require('jade');
var index = require('./routes/index');
var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'blog-node'
});

con.connect();
var listBlog = 'SELECT * FROM POST ORDER BY DATA DESC';
var lerBlog = 'SELECT * FROM POST WHERE ID = ?';
var listaAutor = 'SELECT * FROM AUTOR ORDER BY NOME DESC';

app.get('/index', function (req, res) {
    con.query(listBlog, function (err, results) {
        if (err)
            throw err;

        res.render('index', {
            itens: results,
            title: 'BLOG',
            h1: 'Lista de Posts'
        });
    });
});
app.get('/', function (req, res) {
    con.query(listBlog, function (err, results) {
        if (err)
            throw err;

        res.render('index', {
            itens: results,
            title: 'BLOG',
            h1: 'Lista de Posts'
        });
    });
});

app.get('/blog/:id',function(req,res){
    var id = req.params.id;
    con.query(lerBlog,[id],function(err,results){
        if (err)
            throw err;
        
        var result = results[0];
        res.render('blog',{
            item: result
        });
    });
});

app.get('/cadastro',function(req,res){
     con.query(listBlog, function (err, results) {
        if (err)
            throw err;

        res.render('cadastro', {
            itens: results,
            h1: 'Lista de Posts'
        });
    });
});
app.get('/cadastro/criar',function(req,res){
     con.query(listaAutor, function (err, results) {
        if (err)
            throw err;

        res.render('criar', {
            itens: results
        });
    });
});


app.use('/users', users);



// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});


module.exports = app;
