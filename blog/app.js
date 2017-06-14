var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var jade = require('jade');
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
var insertPost = 'INSERT INTO POST (TITULO,CORPO,AUTOR_ID) VALUES (?,?,?)';
var updatePost = 'UPDATE POST SET TITULO = ? , CORPO = ? WHERE ID = ? ';
var deletarPost = 'DELETE FROM POST WHERE ID = ?';
var loginSql = 'SELECT * FROM AUTOR WHERE ID = (SELECT AUTOR_ID FROM LOGIN WHERE LOGIN = ? AND SENHA = ? )';

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

app.get('/login',function(req,res){
    res.render('login');
});

app.post('/entrar',function(req,res){
    var login = req.body.LOGIN;
    var senha = req.body.SENHA;
    
    con.query(loginSql,[login,senha],function(err,result){
        if (err)
            throw err;
        
        if(result.length>0){
            res.redirect('/cadastro');
        }else{
            res.redirect('/index');
        }
        
    });
});

app.get('/blog/:id', function (req, res) {
    var id = req.params.id;
    con.query(lerBlog, [id], function (err, results) {
        if (err)
            throw err;

        var result = results[0];
        res.render('blog', {
            item: result
        });
    });
});

app.get('/cadastro', function (req, res) {
    con.query(listBlog, function (err, results) {
        if (err)
            throw err;

        res.render('cadastro', {
            itens: results,
            h1: 'Lista de Posts'
        });
    });
});
app.get('/cadastro/criar', function (req, res) {
    con.query(listaAutor, function (err, results) {
        if (err)
            throw err;

        res.render('criar', {
            itens: results
        });
    });
});

app.post('/cadastro/add', function (req, res) {
    var titulo = req.body.TITULO;
    var corpo = req.body.CORPO;
    var autor = req.body.AUTOR;
    if(autor!=null){
        con.query(insertPost, [titulo, corpo, autor]);
    }
    res.redirect('/cadastro');
});

app.get('/cadastro/atualizar/:id', function (req, res) {
    var id = req.params.id;
    con.query(lerBlog, [id], function (err, results) {
        if (err)
            throw err;


        var result = results[0];
        res.render('atualizar', {
            item: result
        });
    });
});

app.post('/cadastro/atualizar/update', function (req, res) {
    var titulo = req.body.TITULO;
    var corpo = req.body.CORPO;
    var id = req.body.ID;
    
    con.query(updatePost, [titulo, corpo, id]);
    res.redirect('/cadastro');
});

app.get('/cadastro/delete/:id',function(req,res){
    var id = req.params.id;
    con.query(deletarPost,[id]);
    res.redirect('/cadastro');
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
