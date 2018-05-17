"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const cucumber_1 = require("cucumber");
const protractor_1 = require("protractor");
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;
let sleep = (ms => new Promise(resolve => setTimeout(resolve, ms)));
let sameCPF = ((elem, cpf) => elem.element(protractor_1.by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(protractor_1.by.name('nomelist')).getText().then(text => text === name));
let sameMeta = ((elem, meta) => elem.element(protractor_1.by.name('metalist')).getText().then(text => text === meta));
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the students page$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='alunos']").click();
    }));
    Given(/^I cannot see a student with CPF "(\d*)" in the students list$/, (cpf) => __awaiter(this, void 0, void 0, function* () {
        var allcpfs = protractor_1.element.all(protractor_1.by.name('cpflist'));
        yield allcpfs;
        var samecpfs = allcpfs.filter(elem => elem.getText().then(text => text === cpf));
        yield samecpfs;
        yield samecpfs.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    }));
    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='namebox']").sendKeys(name);
        yield protractor_1.$("input[name='cpfbox']").sendKeys(cpf);
        yield protractor_1.element(protractor_1.by.buttonText('Adicionar')).click();
    }));
    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem, cpf) && sameName(elem, name));
        yield samenamecpf;
        yield samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
});
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na página de autoavaliacao$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/metas");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='alunos']").click();
    }));
    Given(/^consigo ver o nome "([^\"]*)" na lista de nomes$/, (name) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunologged'));
        yield allalunos;
        var aluno = allalunos.filter(elem => sameName(elem, name));
        yield aluno;
        yield aluno.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    Given(/^a meta “([^\"]*)” esta com valor “([^\"]*)”$/, (goal, value) => __awaiter(this, void 0, void 0, function* () {
        var allmetas = protractor_1.element.all(protractor_1.by.name('goal'));
        yield allmetas;
        var metas = allmetas.filter(elem => elem.getText().then(text => text === value));
        yield metas;
        yield metas.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    When(/^mudo o valor do conceito “([^\"]*)” para “([^\"]*)”$/, (goal, value) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='" + goal + "']").sendKeys(value);
    }));
    When(/^salvo as mudancas realizadas$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.element(protractor_1.by.buttonText('Salvar')).click();
    }));
    Then(/^eu recebo uma mensagem de confirmação$/, () => __awaiter(this, void 0, void 0, function* () {
        var confirmationMessege = protractor_1.element.all(protractor_1.by.name('confirmationMessege'));
        yield confirmationMessege;
        yield confirmationMessege.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
});
