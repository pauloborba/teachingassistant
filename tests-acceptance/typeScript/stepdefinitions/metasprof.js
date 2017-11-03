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
let sameName = ((elem, name) => elem.element(protractor_1.by.name('nomelist')).getText().then(text => text === name));
let sameGoal = ((elem, concept, goal) => elem.element(protractor_1.by.name(concept)).getText().then(text => text === goal));
let sameEvaluation = ((elem, concept, evaluation) => elem.element(protractor_1.by.name(concept + "-A")).getText().then(text => text === evaluation));
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^estou na página de "metas"$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='metas']").click();
    }));
    Given(/^o estudante "[^\"]*" tem conceito "[^\"]*" em "[^\"]*"$/, (aluno, conceito, meta) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos;
        var sameinformations = allalunos.filter(elem => sameName(elem, aluno) && sameGoal(elem, conceito, meta));
        yield sameinformations;
        yield sameinformations.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    Given(/^o estudante "[^\"]*" se autoavaliou com "[^\"]*" em "[^\"]*"$/, (aluno, conceito, autoavaliacao) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos;
        var sameinformations = allalunos.filter(elem => sameName(elem, aluno) && sameEvaluation(elem, conceito, autoavaliacao));
        yield sameinformations;
        yield sameinformations.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    When(/^ eu for para a página de "Alunos discrepantes"$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui-Metas');
        yield protractor_1.$("a[name='discrepantes']").click();
    }));
    Then(/^eu verei o campo de quantidade de alunos com avaliação discrepante com "(\d*)"$/, (quant) => __awaiter(this, void 0, void 0, function* () {
        yield expect(protractor_1.$("p[name='quantDiscrepante']").getText()).to.eventually.equal(quant);
    }));
    Then(/^eu verei o campo de porcentagem com"[^\"]*"$/, (porc) => __awaiter(this, void 0, void 0, function* () {
        yield expect(protractor_1.$("p[name='porcDiscrepante']").getText()).to.eventually.equal(porc);
    }));
    Then(/^a lista de alunos discrepantes terá o nome "[^\"]*"$/, (name) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos;
        var samename = allalunos.filter(elem => elem.getText().then(text => text === name));
        yield samename;
        yield samename.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    Then(/^a lista de alunos discrepantes estará vazia$/, () => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunolist'));
        yield allalunos;
        yield allalunos.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    }));
});
