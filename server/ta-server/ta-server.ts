import express = require('express');
import bodyParser = require("body-parser");

import {Aluno} from '../../gui/ta-gui/src/app/aluno';
import {Avaliacao } from '../../gui/ta-gui/src/app/avaliacao';
import {CadastroDeAlunos} from './cadastrodealunos';

var app = express();

var cadastro: CadastroDeAlunos = new CadastroDeAlunos();

var allowCrossDomain = function(req: any, res: any, next: any) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json());

app.get('/alunos', function (req, res) {
  res.send(JSON.stringify(cadastro.getAlunos()));
})


app.get('/avaliacoes', function (req, res){
  res.send(JSON.stringify(cadastro.getAvaliacoes()));
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


app.post('/avaliacao', function (req: express.Request, res: express.Response) {
  var avaliacao: Avaliacao = <Avaliacao> req.body; //verificar se é mesmo Aluno!
  avaliacao = cadastro.criarAval(avaliacao); 
  if (avaliacao) {
    res.send({"success": "Avaliação cadastrada com sucesso"});
  } else {
    res.send({"failure": "Avaliação não pode ser cadastrada"});
  }
  
})


app.put('/avaliacao', function (req: express.Request, res: express.Response) {
  var avaliacao: Avaliacao = <Avaliacao> req.body;
  avaliacao = cadastro.atualizarAval(avaliacao);  
  if (avaliacao) {
    res.send({"success": "Avaliação foi atualizada com sucesso"});
  } else {
    res.send({"failure": "Avaliação não pode ser atualizada"});
  }
  
})

var server = app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function closeServer(): void {
   server.close();
}

export { app, server, closeServer }
