import { CadastroMonitoresModule } from '../modules/cadastro_monitores';
import { resetStore, store } from '../data/store';

describe('Cadastro de monitores', () => {
  let modulo: CadastroMonitoresModule;

  beforeEach(() => {
    resetStore();
    modulo = new CadastroMonitoresModule();
  });

  it('exige que uma turma seja informada', () => {
    expect(() => modulo.cadastrar('', 'prof-1', { nome: 'Ana', matricula: 'M001' })).toThrow();
  });

  it('cadastra monitores e evita duplicidade', () => {
    const monitor = modulo.cadastrar('turma-1', 'prof-1', { nome: 'Ana', matricula: 'M001' });
    expect(monitor.nome).toBe('Ana');
    expect(() => modulo.cadastrar('turma-1', 'prof-1', { nome: 'Ana', matricula: 'M001' })).toThrow();
    expect(store.monitores.length).toBe(1);
  });
});
