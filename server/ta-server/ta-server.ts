import express = require('express');
import bodyParser = require("body-parser");

import {Aluno} from '../../gui/ta-gui/src/app/aluno';
import {Turma} from '../../gui/ta-gui/src/app/turma';
import {Resultado} from '../../gui/ta-gui/src/app/resultado';
import {CadastroDeAlunos} from './cadastrodealunos';
import {CadastroDeAutoavaliacoes} from './cadastrodeautoavaliacoes';

var app = express();

var cadastro: CadastroDeAlunos = new CadastroDeAlunos();

var turma: Turma = new Turma("ESS 2025.1",
                             ["Specify requirements with quality", "Write quality tests"]);
var autoavaliacoes: CadastroDeAutoavaliacoes = new CadastroDeAutoavaliacoes(turma);

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

app.post('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = Aluno.criarDeDadosExternos(req.body);
  if (aluno) aluno = cadastro.criar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi cadastrado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser cadastrado"});
  }
})

app.put('/aluno', function (req: express.Request, res: express.Response) {
  var aluno: Aluno = Aluno.criarDeDadosExternos(req.body);
  if (aluno) aluno = cadastro.atualizar(aluno);
  if (aluno) {
    res.send({"success": "O aluno foi atualizado com sucesso"});
  } else {
    res.send({"failure": "O aluno não pode ser atualizado"});
  }
})

app.get('/autoavaliacao/:cpf', function (req: express.Request, res: express.Response) {
  var autoavaliacao = autoavaliacoes.autoavaliacaoDe(req.params.cpf);
  var conceitos: any = {};
  turma.getMetas().forEach(function (meta) {
    var conceito = autoavaliacao.conceitoDe(meta);
    conceitos[meta] = conceito ? conceito.toString() : null;
  });
  res.send({"metas": turma.getMetas(), "conceitos": conceitos,
            "aberta": turma.estaComAutoavaliacaoAberta()});
})

app.put('/autoavaliacao/:cpf', function (req: express.Request, res: express.Response) {
  responder(res, autoavaliacoes.registrarConceito(req.params.cpf, req.body.meta, req.body.conceito));
})

app.delete('/autoavaliacao/:cpf/:meta', function (req: express.Request, res: express.Response) {
  responder(res, autoavaliacoes.removerConceito(req.params.cpf, req.params.meta));
})

// Traduz um Resultado do domínio para a resposta HTTP, em um único lugar, para
// que cada rota não repita essa decisão.
function responder(res: express.Response, resultado: Resultado): void {
  if (resultado.sucedeu()) {
    res.send({"success": "A auto-avaliação foi atualizada com sucesso"});
  } else {
    res.status(400).send({"failure": resultado.getErro()});
  }
}

var server = app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function closeServer(): void {
   server.close();
}

export { app, server, closeServer }
