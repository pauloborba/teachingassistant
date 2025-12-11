import { Aluno, Monitor, Professor, Turma, Notificacao, LogEntry } from '../models';


export interface AllocationSnapshot {
 monitorId: string;
 alunoIds: string[];
}


class DataStore {
 professors: Professor[] = [];
 monitores: Monitor[] = [];
 alunos: Aluno[] = [];
 turmas: Turma[] = [];
 notificacoes: Notificacao[] = [];
 logs: LogEntry[] = [];


 constructor() {
   this.seed();
 }


 reset(): void {
   this.professors = [];
   this.monitores = [];
   this.alunos = [];
   this.turmas = [];
   this.notificacoes = [];
   this.logs = [];
   this.seed();
 }


 private seed(): void {
    const professor: Professor = {
     id: 'prof-1',
     nome: 'Profa. Ana',
     email: 'ana@cin.ufpe.br',
     senha: '123456',
     turmas: ['turma-1','turma-2']
   };


   const turma1: Turma = {
     id: 'turma-1',
     nome: 'Engenharia de Software',
     professorId: professor.id,
     monitores: [],
     alunos: []
   };
   const turma2: Turma = {
     id: 'turma-2',
     nome: 'Gerenciamento de Dados e Informação',
     professorId: professor.id,
     monitores: [],
     alunos: []
   };


   const monitoresTurma1: Monitor[] = [
     { id: 'monitor-1', nome: 'Lucas Almeida', matricula: 'M202301', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-2', nome: 'Mariana Rocha', matricula: 'M202302', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-3', nome: 'Tiago Silva',   matricula: 'M202303', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-4', nome: 'Beatriz Lima',  matricula: 'M202304', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-5', nome: 'Rafael Souza',  matricula: 'M202305', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-6', nome: 'Fernanda Costa',matricula: 'M202306', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-7', nome: 'Paulo Santos',  matricula: 'M202307', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-8', nome: 'Juliana Melo',  matricula: 'M202308', turmaId: turma1.id,alunosAlocados: null, senha: 'monitor' },
   ];


   const monitoresTurma2: Monitor[] = [
     { id: 'monitor-9',  nome: 'Gabriel Martins',     matricula: 'M202309', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-10', nome: 'Larissa Souza',       matricula: 'M202310', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-11', nome: 'Henrique Costa',      matricula: 'M202311', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-12', nome: 'Isabela Freitas',     matricula: 'M202312', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-13', nome: 'Rodrigo Alves',       matricula: 'M202313', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-14', nome: 'Amanda Nunes',        matricula: 'M202314', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-15', nome: 'Felipe Rocha',        matricula: 'M202315', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
     { id: 'monitor-16', nome: 'Adriana Silva',       matricula: 'M202316', turmaId: turma2.id,alunosAlocados: null, senha: 'monitor' },
   ];


   const alunosBase1: Aluno[] = [
     { id: 'aluno-1',  nome: 'Alice Figueiredo',      matricula: '202301', turmaId: turma1.id, monitorId: null, email: 'alice@alunos.edu', senha: 'aluno' },
     { id: 'aluno-2',  nome: 'Bruno Siqueira',        matricula: '202302', turmaId: turma1.id, monitorId: null, email: 'bruno@alunos.edu', senha: 'aluno' },
     { id: 'aluno-3',  nome: 'Camila Tavares',        matricula: '202303', turmaId: turma1.id, monitorId: null, email: 'camila@alunos.edu', senha: 'aluno' },
     { id: 'aluno-4',  nome: 'Daniel Rocha',          matricula: '202304', turmaId: turma1.id, monitorId: null, email: 'daniel@alunos.edu', senha: 'aluno' },
     { id: 'aluno-5',  nome: 'Eduarda Campos',        matricula: '202305', turmaId: turma1.id, monitorId: null, email: 'eduarda@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-6',  nome: 'Felipe Souza',          matricula: '202306', turmaId: turma1.id, monitorId: null, email: 'felipe@alunos.edu', senha: 'aluno' },
     { id: 'aluno-7',  nome: 'Gabriela Martins',      matricula: '202307', turmaId: turma1.id, monitorId: null, email: 'gabriela@alunos.edu', senha: 'aluno' },
     { id: 'aluno-8',  nome: 'Henrique Lima',         matricula: '202308', turmaId: turma1.id, monitorId: null, email: 'henrique@alunos.edu', senha: 'aluno' },
     { id: 'aluno-9',  nome: 'Isabela Alves',         matricula: '202309', turmaId: turma1.id, monitorId: null, email: 'isabela@alunos.edu', senha: 'aluno' },
     { id: 'aluno-10', nome: 'João Pedro',            matricula: '202310', turmaId: turma1.id, monitorId: null, email: 'joaopedro@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-11', nome: 'Karina Duarte',         matricula: '202311', turmaId: turma1.id, monitorId: null, email: 'karina@alunos.edu', senha: 'aluno' },
     { id: 'aluno-12', nome: 'Lucas Ferreira',        matricula: '202312', turmaId: turma1.id, monitorId: null, email: 'lucas@alunos.edu', senha: 'aluno' },
     { id: 'aluno-13', nome: 'Mariana Silva',         matricula: '202313', turmaId: turma1.id, monitorId: null, email: 'mariana@alunos.edu', senha: 'aluno' },
     { id: 'aluno-14', nome: 'Nicolas Ribeiro',       matricula: '202314', turmaId: turma1.id, monitorId: null, email: 'nicolas@alunos.edu', senha: 'aluno' },
     { id: 'aluno-15', nome: 'Olivia Fernandes',      matricula: '202315', turmaId: turma1.id, monitorId: null, email: 'olivia@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-16', nome: 'Paulo Henrique',        matricula: '202316', turmaId: turma1.id, monitorId: null, email: 'paulo@alunos.edu', senha: 'aluno' },
     { id: 'aluno-17', nome: 'Queila Santos',         matricula: '202317', turmaId: turma1.id, monitorId: null, email: 'queila@alunos.edu', senha: 'aluno' },
     { id: 'aluno-18', nome: 'Rafael Gomes',          matricula: '202318', turmaId: turma1.id, monitorId: null, email: 'rafael@alunos.edu', senha: 'aluno' },
     { id: 'aluno-19', nome: 'Sofia Almeida',         matricula: '202319', turmaId: turma1.id, monitorId: null, email: 'sofia@alunos.edu', senha: 'aluno' },
     { id: 'aluno-20', nome: 'Thiago Monteiro',       matricula: '202320', turmaId: turma1.id, monitorId: null, email: 'thiago@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-21', nome: 'Ursula Mendes',         matricula: '202321', turmaId: turma1.id, monitorId: null, email: 'ursula@alunos.edu', senha: 'aluno' },
     { id: 'aluno-22', nome: 'Vinicius Costa',        matricula: '202322', turmaId: turma1.id, monitorId: null, email: 'vinicius@alunos.edu', senha: 'aluno' },
     { id: 'aluno-23', nome: 'Wesley Barros',         matricula: '202323', turmaId: turma1.id, monitorId: null, email: 'wesley@alunos.edu', senha: 'aluno' },
     { id: 'aluno-24', nome: 'Xavier Pinheiro',       matricula: '202324', turmaId: turma1.id, monitorId: null, email: 'xavier@alunos.edu', senha: 'aluno' },
     { id: 'aluno-25', nome: 'Yara Monte',            matricula: '202325', turmaId: turma1.id, monitorId: null, email: 'yara@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-26', nome: 'Zeca Vasconcelos',      matricula: '202326', turmaId: turma1.id, monitorId: null, email: 'zeca@alunos.edu', senha: 'aluno' },
     { id: 'aluno-27', nome: 'Amanda Duarte',         matricula: '202327', turmaId: turma1.id, monitorId: null, email: 'amanda@alunos.edu', senha: 'aluno' },
     { id: 'aluno-28', nome: 'Bernardo Guimarães',    matricula: '202328', turmaId: turma1.id, monitorId: null, email: 'bernardo@alunos.edu', senha: 'aluno' },
     { id: 'aluno-29', nome: 'Carolina Moura',        matricula: '202329', turmaId: turma1.id, monitorId: null, email: 'carolina@alunos.edu', senha: 'aluno' },
     { id: 'aluno-30', nome: 'Diego Machado',         matricula: '202330', turmaId: turma1.id, monitorId: null, email: 'diego@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-31', nome: 'Elisa Nogueira',        matricula: '202331', turmaId: turma1.id, monitorId: null, email: 'elisa@alunos.edu', senha: 'aluno' },
     { id: 'aluno-32', nome: 'Flávio Antunes',        matricula: '202332', turmaId: turma1.id, monitorId: null, email: 'flavio@alunos.edu', senha: 'aluno' },
     { id: 'aluno-33', nome: 'Giovana Reis',          matricula: '202333', turmaId: turma1.id, monitorId: null, email: 'giovana@alunos.edu', senha: 'aluno' },
     { id: 'aluno-34', nome: 'Heitor Lima',           matricula: '202334', turmaId: turma1.id, monitorId: null, email: 'heitor@alunos.edu', senha: 'aluno' },
     { id: 'aluno-35', nome: 'Isis Ferreira',         matricula: '202335', turmaId: turma1.id, monitorId: null, email: 'isis@alunos.edu', senha: 'aluno' },
  
     { id: 'aluno-36', nome: 'Jonas Castro',          matricula: '202336', turmaId: turma1.id, monitorId: null, email: 'jonas@alunos.edu', senha: 'aluno' },
     { id: 'aluno-37', nome: 'Larissa Prado',         matricula: '202337', turmaId: turma1.id, monitorId: null, email: 'larissa@alunos.edu', senha: 'aluno' },
     { id: 'aluno-38', nome: 'Miguel Azevedo',        matricula: '202338', turmaId: turma1.id, monitorId: null, email: 'miguel@alunos.edu', senha: 'aluno' },
     { id: 'aluno-39', nome: 'Natália Correia',       matricula: '202339', turmaId: turma1.id, monitorId: null, email: 'natalia@alunos.edu', senha: 'aluno' },
     { id: 'aluno-40', nome: 'Otávio Sales',          matricula: '202340', turmaId: turma1.id, monitorId: null, email: 'otavio@alunos.edu', senha: 'aluno' },
   ];
  
   const alunosBase2: Aluno[] = [
     { id: 'aluno-41',  nome: 'Alan Ferreira',        matricula: '202401', turmaId: turma2.id, monitorId: null, email: 'alan@alunos.edu', senha: 'aluno' },
     { id: 'aluno-42',  nome: 'Beatriz Moreira',      matricula: '202402', turmaId: turma2.id, monitorId: null, email: 'beatriz@alunos.edu', senha: 'aluno' },
     { id: 'aluno-43',  nome: 'Caio Brito',           matricula: '202403', turmaId: turma2.id, monitorId: null, email: 'caio@alunos.edu', senha: 'aluno' },
     { id: 'aluno-44',  nome: 'Diana Castro',         matricula: '202404', turmaId: turma2.id, monitorId: null, email: 'diana@alunos.edu', senha: 'aluno' },
     { id: 'aluno-45',  nome: 'Eduardo Falcão',       matricula: '202405', turmaId: turma2.id, monitorId: null, email: 'eduardo.falcao@alunos.edu', senha: 'aluno' },     
    
     { id: 'aluno-46',  nome: 'Fernanda Ramos',       matricula: '202406', turmaId: turma2.id, monitorId: null, email: 'fernanda@alunos.edu', senha: 'aluno' },
     { id: 'aluno-47',  nome: 'Guilherme Pires',      matricula: '202407', turmaId: turma2.id, monitorId: null, email: 'guilherme.pires@alunos.edu', senha: 'aluno' },
     { id: 'aluno-48',  nome: 'Helena Santiago',      matricula: '202408', turmaId: turma2.id, monitorId: null, email: 'helena@alunos.edu', senha: 'aluno' },
     { id: 'aluno-49',  nome: 'Igor Fernandes',       matricula: '202409', turmaId: turma2.id, monitorId: null, email: 'igor@alunos.edu', senha: 'aluno' },
     { id: 'aluno-50', nome: 'Julia Costa',           matricula: '202410', turmaId: turma2.id, monitorId: null, email: 'julia.costa@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-51', nome: 'Kleber Moura',          matricula: '202411', turmaId: turma2.id, monitorId: null, email: 'kleber@alunos.edu', senha: 'aluno' },
     { id: 'aluno-52', nome: 'Larissa Ferreira',      matricula: '202412', turmaId: turma2.id, monitorId: null, email: 'larissa@alunos.edu', senha: 'aluno' },
     { id: 'aluno-53', nome: 'Marcos Vinicius',       matricula: '202413', turmaId: turma2.id, monitorId: null, email: 'marcos.vinicius@alunos.edu', senha: 'aluno' },
     { id: 'aluno-54', nome: 'Nicole Arruda',         matricula: '202414', turmaId: turma2.id, monitorId: null, email: 'nicole@alunos.edu', senha: 'aluno' },
     { id: 'aluno-55', nome: 'Otávio Rocha',          matricula: '202415', turmaId: turma2.id, monitorId: null, email: 'otavio.rocha@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-56', nome: 'Paula Mendes',          matricula: '202416', turmaId: turma2.id, monitorId: null, email: 'paula.mendes@alunos.edu', senha: 'aluno' },
     { id: 'aluno-57', nome: 'Rodrigo Carvalho',      matricula: '202417', turmaId: turma2.id, monitorId: null, email: 'rodrigo.carvalho@alunos.edu', senha: 'aluno' },
     { id: 'aluno-58', nome: 'Sabrina Lopes',         matricula: '202418', turmaId: turma2.id, monitorId: null, email: 'sabrina@alunos.edu', senha: 'aluno' },
     { id: 'aluno-59', nome: 'Thiago Ribeiro',        matricula: '202419', turmaId: turma2.id, monitorId: null, email: 'thiago.ribeiro@alunos.edu', senha: 'aluno' },
     { id: 'aluno-60', nome: 'Ursula Tavares',        matricula: '202420', turmaId: turma2.id, monitorId: null, email: 'ursula@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-61', nome: 'Vitor Santos',          matricula: '202421', turmaId: turma2.id, monitorId: null, email: 'vitor.santos@alunos.edu', senha: 'aluno' },
     { id: 'aluno-62', nome: 'Willian Dias',          matricula: '202422', turmaId: turma2.id, monitorId: null, email: 'willian@alunos.edu', senha: 'aluno' },
     { id: 'aluno-63', nome: 'Xavier Lins',           matricula: '202423', turmaId: turma2.id, monitorId: null, email: 'xavier.lins@alunos.edu', senha: 'aluno' },
     { id: 'aluno-64', nome: 'Yasmin Duarte',         matricula: '202424', turmaId: turma2.id, monitorId: null, email: 'yasmin.duarte@alunos.edu', senha: 'aluno' },
     { id: 'aluno-65', nome: 'Zoe Andrade',           matricula: '202425', turmaId: turma2.id, monitorId: null, email: 'zoe@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-66', nome: 'Arthur Cavalcante',     matricula: '202426', turmaId: turma2.id, monitorId: null, email: 'arthur.c@alunos.edu', senha: 'aluno' },
     { id: 'aluno-67', nome: 'Bruna Barros',          matricula: '202427', turmaId: turma2.id, monitorId: null, email: 'bruna@alunos.edu', senha: 'aluno' },
     { id: 'aluno-68', nome: 'César Nogueira',        matricula: '202428', turmaId: turma2.id, monitorId: null, email: 'cesar@alunos.edu', senha: 'aluno' },
     { id: 'aluno-69', nome: 'Daniela Torres',        matricula: '202429', turmaId: turma2.id, monitorId: null, email: 'daniela@alunos.edu', senha: 'aluno' },
     { id: 'aluno-70', nome: 'Eduardo Ramos',         matricula: '202430', turmaId: turma2.id, monitorId: null, email: 'eduardo.r@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-71', nome: 'Fernanda Teixeira',     matricula: '202431', turmaId: turma2.id, monitorId: null, email: 'fernanda.t@alunos.edu', senha: 'aluno' },
     { id: 'aluno-72', nome: 'Gustavo Avelar',        matricula: '202432', turmaId: turma2.id, monitorId: null, email: 'gustavo@alunos.edu', senha: 'aluno' },
     { id: 'aluno-73', nome: 'Helena Moura',          matricula: '202433', turmaId: turma2.id, monitorId: null, email: 'helena@alunos.edu', senha: 'aluno' },
     { id: 'aluno-74', nome: 'Igor Santos',           matricula: '202434', turmaId: turma2.id, monitorId: null, email: 'igor.santos@alunos.edu', senha: 'aluno' },
     { id: 'aluno-75', nome: 'Juliana Pinto',         matricula: '202435', turmaId: turma2.id, monitorId: null, email: 'juliana@alunos.edu', senha: 'aluno' },
    
     { id: 'aluno-76', nome: 'Leonardo Vasconcelos',  matricula: '202436', turmaId: turma2.id, monitorId: null, email: 'leonardo@alunos.edu', senha: 'aluno' },
     { id: 'aluno-77', nome: 'Marina Rocha',          matricula: '202437', turmaId: turma2.id, monitorId: null, email: 'marina@alunos.edu', senha: 'aluno' },
     { id: 'aluno-78', nome: 'Nathan Costa',          matricula: '202438', turmaId: turma2.id, monitorId: null, email: 'nathan@alunos.edu', senha: 'aluno' },
     { id: 'aluno-79', nome: 'Patrícia Lima',         matricula: '202439', turmaId: turma2.id, monitorId: null, email: 'patricia@alunos.edu', senha: 'aluno' },
     { id: 'aluno-80', nome: 'Rodrigo Martins',       matricula: '202440', turmaId: turma2.id, monitorId: null, email: 'rodrigo@alunos.edu', senha: 'aluno' },
     { id: 'aluno-80', nome: 'Rodrigo Lima',       matricula: '202441', turmaId: turma2.id, monitorId: null, email: 'rodrigoLima@alunos.edu', senha: 'aluno' }
    ];


   turma1.monitores = monitoresTurma1.map(m => m.id);
   turma2.monitores = monitoresTurma2.map(m => m.id);


   turma1.alunos = alunosBase1.map(aluno => aluno.id);
   turma2.alunos = alunosBase2.map(aluno => aluno.id);


   this.professors.push(professor);
   this.turmas.push(turma1, turma2);
   this.alunos.push(...alunosBase1, ...alunosBase2);
   this.monitores.push(...monitoresTurma1, ...monitoresTurma2);
 }


}


export const store = new DataStore();


export function resetStore(): void {
 store.reset();
}


