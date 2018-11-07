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
let pAND = ((p, q) => p.then(a => q.then(b => a && b)));
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
    Given(/^I have a student "([^\"]*)" with CPF "(\d*)" in the students list$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='namebox']").sendKeys(name);
        yield protractor_1.$("input[name='cpfbox']").sendKeys(cpf);
        yield protractor_1.element(protractor_1.by.buttonText('Adicionar')).click();
    }));
    When(/^I try to register the student "([^\"]*)" with CPF "(\d*)"$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='namebox']").sendKeys(name);
        yield protractor_1.$("input[name='cpfbox']").sendKeys(cpf);
        yield protractor_1.element(protractor_1.by.buttonText('Adicionar')).click();
    }));
    Then(/^I cannot see "([^\"]*)" with CPF "(\d*)" in the students list$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos.filter(elem => pAND(sameCPF(elem, cpf), sameName(elem, name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    }));
    When(/^I try to remove the student "([^\"]*)" with CPF "(\d*)"$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.element(protractor_1.by.id(cpf)).click();
    }));
    Then(/^I can see "([^\"]*)" with CPF "(\d*)" in the students list$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos.filter(elem => pAND(sameCPF(elem, cpf), sameName(elem, name))).then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
});
