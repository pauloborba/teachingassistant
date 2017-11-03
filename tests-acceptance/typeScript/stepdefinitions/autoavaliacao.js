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
let sameCPF = ((elem, cpf) => elem.element(protractor_1.by.name('cpfmetalist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(protractor_1.by.name('nomemetalist')).getText().then(text => text === name));
let sameMeta = ((elem, metaname, meta) => elem.element(protractor_1.by.name(metaname)).getAttribute('ng-reflect-model').then(attr => attr === meta));
let emptyField = ((elem, field) => elem.element(protractor_1.by.name(field)).getAttribute('ng-reflect-model').then(attr => {
    if (attr) {
        return attr.length === 0;
    }
    else {
        return true;
    }
}, function () {
    return true;
}));
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^I am at the metas page$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='metas']").click();
    }));
    Given(/^I can see the student "([^\"]*)" with CPF "(\d*)" in the students list without concepts$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunosmetalist'));
        yield allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem, cpf) && sameName(elem, name));
        yield samenamecpf;
        yield samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        // faz com que os campos fiquem vazios
        yield samenamecpf.first().element(protractor_1.by.name('requisitos')).sendKeys(protractor_1.protractor.Key.CONTROL, "a", protractor_1.protractor.Key.NULL, protractor_1.protractor.Key.DELETE);
        yield samenamecpf.first().element(protractor_1.by.name('gerconfig')).sendKeys(protractor_1.protractor.Key.CONTROL, "a", protractor_1.protractor.Key.NULL, protractor_1.protractor.Key.DELETE);
        // ativar o onchange
        yield samenamecpf.first().element(protractor_1.by.name('cpfmetalist')).click();
        yield expect(emptyField(samenamecpf.first(), 'requisitos')).to.eventually.equal(true);
        yield expect(emptyField(samenamecpf.first(), 'gerconfig')).to.eventually.equal(true);
    }));
    When(/^I try to register meta "(\w*)" to student "([^\"]*)" with CPF "(\d*)" in the "(.*)" field$/, (meta, name, cpf, field) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunosmetalist'));
        yield allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem, cpf) && sameName(elem, name));
        yield samenamecpf;
        var fd;
        if (field === "Requisitos")
            fd = 'requisitos';
        else
            fd = 'gerconfig';
        yield samenamecpf.first().element(protractor_1.by.name(fd)).sendKeys(meta);
        // ativar onchange
        yield samenamecpf.first().element(protractor_1.by.name('cpfmetalist')).click();
    }));
    When(/^I reload the page$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.refresh();
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
    }));
    Then(/^I can see the student "([^\"]*)" with CPF "(\d*)" with meta "(\w*)" in "(.*)"\.?$/, (name, cpf, meta, field) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunosmetalist'));
        yield allalunos;
        var fd;
        if (field === "Requisitos")
            fd = 'requisitos';
        else
            fd = 'gerconfig';
        var samenamecpf = allalunos.filter(elem => sameCPF(elem, cpf) && sameName(elem, name));
        yield samenamecpf;
        yield samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        yield expect(sameMeta(samenamecpf.first(), fd, meta)).to.eventually.equal(true);
    }));
    Then(/^I can see the student "([^\"]*)" with CPF "(\d*)" still without metas.$/, (name, cpf) => __awaiter(this, void 0, void 0, function* () {
        var allalunos = protractor_1.element.all(protractor_1.by.name('alunosmetalist'));
        yield allalunos;
        var samenamecpf = allalunos.filter(elem => sameCPF(elem, cpf) && sameName(elem, name));
        yield samenamecpf;
        yield samenamecpf.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        yield expect(emptyField(samenamecpf.first(), 'requisitos')).to.eventually.equal(true);
        yield expect(emptyField(samenamecpf.first(), 'gerconfig')).to.eventually.equal(true);
    }));
});
