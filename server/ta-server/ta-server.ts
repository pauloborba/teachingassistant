import express = require('express');
import bodyParser = require("body-parser");

import {Aluno} from '../../gui/ta-gui/src/app/aluno';
import {Meta} from '../../gui/ta-gui/src/app/meta';
import {CadastroDeAlunos} from './cadastrodealunos';
import {Metas} from './metas';

var app = express();

var cadastro: CadastroDeAlunos = new CadastroDeAlunos();
var metasService: Metas = new Metas();

var allowCrossDomain = function(req: any, res: any, next: any) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json());

// Endpoints de Alunos
app.get('/alunos', function (req, res) {
  res.send(JSON.stringify(cadastro.getAlunos()));
})

app.post('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body; //verificar se é mesmo Aluno!
  aluno = cadastro.criar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi cadastrado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser cadastrado"});
  }
})

app.put('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body;
  aluno = cadastro.atualizar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi atualizado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser atualizado"});
  }
})

// Endpoints de Metas
app.get('/metas', function (req, res) {
  res.send(JSON.stringify(metasService.getMetas()));
})

app.post('/metas', function (req: express.Request, res: express.Response) {
  var meta: Meta = <Meta>req.body;
  meta = metasService.criar(meta);
  if (meta) {
    res.send({ "success": "A meta foi adicionada com sucesso" });
  } else {
    res.send({ "failure": "A meta não pode ser adicionada" });
  }
})

app.put('/metas', function (req: express.Request, res: express.Response) {
  var meta: Meta = <Meta>req.body.meta;
  var nome: string = req.body.nome;
  meta = metasService.atualizar(meta, nome);
  if (meta) {
    res.send({ "success": "A meta foi atualizada com sucesso" });
  } else {
    res.send({ "failure": "A meta não pode ser atualizada" });
  }
})

app.delete('/metas', function (req: express.Request, res: express.Response) {
  var meta: Meta = <Meta>req.body;
  meta = metasService.remover(meta);
  if (meta) {
    res.send({ "success": "A meta foi removida com sucesso" });
  } else {
    res.send({ "failure": "A meta não pode ser removida" });
  }
})

var server = app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function closeServer(): void {
   server.close();
}

export { app, server, closeServer }
