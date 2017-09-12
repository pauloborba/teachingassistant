import express = require('express');
import bodyParser = require("body-parser");

import {Aluno} from '../../gui/ta-gui/src/app/aluno';
import {CadastroDeAlunos} from './cadastrodealunos';

var app = express();

var alunos: CadastroDeAlunos = new CadastroDeAlunos();

app.use(bodyParser.json());

app.get('/alunos', function (req, res) {
  var aluno: string = JSON.stringify(alunos.getAlunos());
  res.send(aluno);
})

app.post('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body; //verificar se é mesmo Aluno!
  aluno = alunos.criar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi cadastrado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser cadastrado"});
  }
})

app.put('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = <Aluno> req.body;
  aluno = alunos.atualizar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi atualizado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser atualizado"});
  }
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

export { app }
