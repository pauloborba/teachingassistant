import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));

let sameCPF = ((elem, cpf) => elem.element(by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(by.name('nomelist')).getText().then(text => text === name));

defineSupportCode(function ({ Given, When, Then }) {
    Given(/^Eu estou logado como professor, com login “([^\"]*)” e senha “([^\"]*)”$/, async (login, senha) => {
        await browser.get("http://localhost:4200/teacher_login/");
        await $("input[name='login_field']").sendKeys(<string> login);
        await $("input[name='passwd_field']").sendKeys(<string> senha);
    })

    Given(/^Eu posso ver a auto-avaliação do aluno “([^\"]*)” com “([^\"]*)” em “([^\"]*)”, “([^\"]*)” em “([^\"]*)”, “([^\"]*)” em “([^\"]*)”, "([^\"]*)” em “([^\"]*)” e “([^\"]*)” em “([^\"]*)”$/,  async(<string> aluno,nota1, meta1, nota2, meta2, nota3, meta3) => {
        let cur_field = element(by.name(aluno)).element(by.name(meta1+'_student_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota1));
        });
        cur_field = element(by.name(aluno)).element(by.name(meta2+'_student_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota2));
        });
        cur_field = element(by.name(aluno)).element(by.name(meta3+'_student_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota3));
        });
    });

    Given(/^O aluno “([^\"]*)” foi avaliado com “([^\"]*)” em “([^\"]*)”, “([^\"]*)” em “([^\"]*)”, “([^\"]*)” em “([^\"]*)”, "([^\"]*)” em “([^\"]*)” e “([^\"]*)” em “([^\"]*)”$/,  async(<string> aluno,nota1, meta1, nota2, meta2, nota3, meta3) => {
        let cur_field = element(by.name(aluno)).element(by.name(meta1+'_teacher_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota1));
        });
        cur_field = element(by.name(aluno)).element(by.name(meta2+'_teacher_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota2));
        });
        cur_field = element(by.name(aluno)).element(by.name(meta3+'_teacher_evaluation'));
        cur_field.then(elems=> {
            expect(elems[0].getText().to.eventually.equal(nota3));
        });
    });

    When(/^Eu entro na pagina "([^\"]*)"$/, async (pagina) => {
        await browser.get("http://localhost:4200/"+pagina);
    });

    Then(/^Eu posso ver “"([^\"]*)"” no campo "([^\"]*)", "([^\"]*)" no campo "([^\"]*)" e o nome "([^\"]*)" no campo "([^\"]*)"$/, async (conteudo1, campo1, conteudo2, campo2, conteudo3, campo3) => {
        let avaliacao = element.all(by.name(campo1));
            avaliacao.then(elems=> {
          expect(elems[0].getText().to.eventually.equal(conteudo1));
        });
        avaliacao = element.all(by.name(campo2));
        avaliacao.then(elems=> {
          expect(elems[0].getText().to.eventually.equal(conteudo2));
        });    
        avaliacao = element.all(by.name(campo3));
        avaliacao.then(elems=> {
          expect(elems[0].getText().to.eventually.equal(conteudo3));
        });    
    });
})
