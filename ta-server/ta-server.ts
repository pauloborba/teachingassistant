
import express = require('express');

import bodyParser = require("body-parser");

var taserver = express();

var allowCrossDomain = function(req: any, res: any, next: any) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

taserver.use(allowCrossDomain);
taserver.use(bodyParser.json());

taserver.get('/', function(req,res) {
  res.send("Oi, essa é uma resposta padrão do servidor do Teaching Assistant 2020-3")
})


taserver.listen(3000, function () {
  console.log('Example app listening on port 3000!');
})
