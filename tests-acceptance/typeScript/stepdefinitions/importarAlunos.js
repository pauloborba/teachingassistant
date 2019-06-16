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
var EC = protractor_1.protractor.ExpectedConditions;
let sameCPF = ((elem, cpf) => elem.element(protractor_1.by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(protractor_1.by.name('nomelist')).getText().then(text => text === name));
let pAND = ((p, q) => p.then(a => q.then(b => a && b)));
var path = require('path');
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na pagina de alunos$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='alunos']").click();
    }));
    When(/^eu escolho o arquivo "([^\"]*)"$/, (arquivoName) => __awaiter(this, void 0, void 0, function* () {
        const arquivo = './' + arquivoName;
        var ele = protractor_1.element(protractor_1.by.id('file-upload'));
        yield protractor_1.browser.wait(EC.presenceOf(ele), 5000);
        const absolutePath = path.resolve(__dirname, arquivo);
        yield ele.sendKeys(absolutePath);
        //await $("a[name='cadastrarCSV']").click();
    }));
    When(/^eu escolho o arquivo "([^\"]*)" que contém o aluno "([^\"]*)" de CPF "(\d*)" já cadastrado$/, (arquivoName, nome, cpf) => __awaiter(this, void 0, void 0, function* () {
        const arquivo = './' + arquivoName;
        var ele = protractor_1.element(protractor_1.by.id('file-upload'));
        yield protractor_1.browser.wait(EC.presenceOf(ele), 5000);
        const absolutePath = path.resolve(__dirname, arquivo);
        yield ele.sendKeys(absolutePath);
        //await $("a[name='cadastrarCSV']").click();
    }));
    Then(/^eu vejo o aluno "([^\"]*)" com seu CPF "(\d*)" na lista de alunos$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        allalunos.filter(elem => pAND(sameCPF(elem, cpf), sameName(elem, name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    Then(/^eu vejo uma mensagem de erro$/, () => __awaiter(this, void 0, void 0, function* () {
        protractor_1.browser.wait(EC.alertIsPresent(), 1000);
        let ale = protractor_1.browser.switchTo().alert();
        ale.accept();
        ale.dismiss();
    }));
});
