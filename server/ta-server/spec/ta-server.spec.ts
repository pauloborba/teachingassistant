import request = require('request-promise');
import { resetStore } from '../data/store';

const baseUrl = 'http://localhost:3000';

describe('Servidor TeachingAssistant', () => {
  let server: any;

  beforeAll(() => {
    server = require('../ta-server');
  });

  afterAll(() => {
    server.closeServer();
  });

  beforeEach(() => {
    resetStore();
  });

  it('retorna turmas disponíveis', () => {
    return request
      .get({ uri: `${baseUrl}/turmas?professorId=prof-1`, json: true })
      .then((resposta: any) => {
        expect(resposta.success).toBe(true);
        expect(resposta.data.length).toBeGreaterThan(0);
      });
  });

  it('permite o login do professor', () => {
    return request
      .post({
        uri: `${baseUrl}/auth/login`,
        json: { tipo: 'Professor', identificador: 'ana@cin.ufpe.br', senha: '123456' }
      })
      .then((resposta: any) => {
        expect(resposta.success).toBe(true);
        expect(resposta.data.usuario.nome).toContain('Ana');
      });
  });

  it('cadastra monitores e executa alocação aleatória', () => {
    const options = {
      uri: `${baseUrl}/turmas/turma-1/monitores`,
      method: 'POST',
      headers: { 'x-professor-id': 'prof-1' },
      json: { nome: 'Monitor Teste', matricula: 'M500' }
    };
    return request(options)
      .then(() =>
        request({
          uri: `${baseUrl}/turmas/turma-1/alocacoes/random`,
          method: 'POST',
          headers: { 'x-professor-id': 'prof-1' },
          json: true
        })
      )
      .then((resposta: any) => {
        expect(resposta.success).toBe(true);
        expect(resposta.data.length).toBeGreaterThan(0);
      });
  });
});
