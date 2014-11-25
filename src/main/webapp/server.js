var application_root = __dirname,
    express = require("express"),
    path = require("path"),
    bodyParser = require('body-parser'),
    methodOverride = require("method-override");

var app = express();

// Config

app.use(bodyParser());
app.use(methodOverride());
app.use(express.static(path.join(application_root, "public")));
app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500).send('Something broke!'+err.stack);
});

// Launch server

var server = app.listen(8080, function() {
    console.log('Server is up and listening on port %d', server.address().port);
});
