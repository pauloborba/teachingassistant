import express = require('express');
import bodyParser = require('body-parser');

import { AuthModule } from './modules/auth';
import { CadastroMonitoresModule } from './modules/cadastro_monitores';
import { randomAllocation } from './modules/alocacao/random_allocation';
import { manualAllocation } from './modules/alocacao/manual_allocation';
import { aplicarCorrecaoManual } from './modules/correcao_manual';
import { realocarAutomaticamente } from './modules/realocacao';
import { NotificacaoModule } from './modules/notificacoes';
import { store } from './data/store';
import { getAlunosByTurma, getMonitoresByTurma, revalidarTurma, getTurmaById } from './modules/helpers';

const app = express();

const authModule = new AuthModule();
const cadastroModule = new CadastroMonitoresModule();
const notificacaoModule = new NotificacaoModule();

const allowCrossDomain = function(req: any, res: any, next: any) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, x-professor-id');
  next();
};

app.use(allowCrossDomain);
app.use(bodyParser.json());

function extractProfessorId(req: any): string {
  return (req.headers['x-professor-id'] as string) || (req.body && req.body.professorId) || '';
}

function handleRequest(action: () => any, res: any) {
  try {
    const resultado = action();
    res.send({ success: true, data: resultado });
  } catch (error) {
    res.status(400).send({ success: false, error: error.message || 'Operação inválida.' });
  }
}

app.post('/auth/login', (req: any, res: any) => {
  handleRequest(() => authModule.login(req.body), res);
});

app.get('/turmas', (req: any, res: any) => {
  const professorId = req.query.professorId as string | undefined;
  const turmas = store.turmas
    .filter(t => !professorId || t.professorId === professorId)
    .map(t => ({
      id: t.id,
      nome: t.nome,
      professorId: t.professorId,
      totalAlunos: getAlunosByTurma(t.id).length,
      totalMonitores: getMonitoresByTurma(t.id).length
    }));
  res.send({ success: true, data: turmas });
});

app.get('/turmas/:id/alunos', (req: any, res: any) => {
  handleRequest(() => getAlunosByTurma(req.params.id), res);
});

app.get('/turmas/:id/monitores', (req: any, res: any) => {
  handleRequest(() => getMonitoresByTurma(req.params.id), res);
});

app.post('/turmas/:id/monitores', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  handleRequest(() => cadastroModule.cadastrar(req.params.id, professorId, req.body), res);
});

app.post('/turmas/:id/alocacoes/random', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  handleRequest(() => randomAllocation(req.params.id, professorId), res);
});

app.post('/turmas/:id/alocacoes/manual', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  handleRequest(() => manualAllocation(req.params.id, professorId, req.body.atribuicoes || []), res);
});

app.post('/turmas/:id/correcao', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  handleRequest(() => aplicarCorrecaoManual(req.params.id, professorId, req.body.atribuicoes || []), res);
});

app.post('/turmas/:id/realocacao', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  const limite = req.body && req.body.limiteMaximo ? Number(req.body.limiteMaximo) : undefined;
  handleRequest(() => realocarAutomaticamente(req.params.id, professorId, limite || 0), res);
});

app.post('/turmas/:id/notificacoes', (req: any, res: any) => {
  const professorId = extractProfessorId(req);
  handleRequest(() => notificacaoModule.enviarResumoFinal(req.params.id, professorId), res);
});

app.get('/turmas/:id/revalidar', (req: any, res: any) => {
  handleRequest(() => revalidarTurma(req.params.id), res);
});

app.get('/logs', (_req: any, res: any) => {
  res.send({ success: true, data: store.logs });
});

app.get('/turmas/:id', (req: any, res: any) => {
  handleRequest(() => getTurmaById(req.params.id), res);
});

const server = app.listen(3000, () => {
  console.log('Teaching Assistant server listening on port 3000');
});

function closeServer(): void {
  server.close();
}

export { app, server, closeServer };
