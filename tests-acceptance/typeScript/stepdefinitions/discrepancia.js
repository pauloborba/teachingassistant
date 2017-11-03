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
let sameCPF = ((elem, cpf) => elem.element(protractor_1.by.name('cpflist')).getText().then(text => text === cpf));
let sameName = ((elem, name) => elem.element(protractor_1.by.name('nomelist')).getText().then(text => text === name));
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
    Given(/^I am at the discrepancias page$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='discrepancias']").click();
    }));
    Given(/^I can see the student "(.*)" with goals "(.*)", "(.*)", "(.*)", "(.*)", "(.*)"$/, (name, goal1, goal2, goal3, goal4, goal5) => __awaiter(this, void 0, void 0, function* () {
        var arr = [];
        arr.push(goal1);
        arr.push(goal2);
        arr.push(goal3);
        arr.push(goal4);
        arr.push(goal5);
        var allnames = protractor_1.element.all(protractor_1.by.name('namelist'));
        yield allnames;
        var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
        yield samenames;
        yield samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        // garantindo que vejo as metas que devo ver em pedro
        for (var i = 0; i < 5; i += 1) {
            yield expect(sameMeta(samenames.first(), 'goal' + i, arr[i])).to.eventually.equal(true);
        }
    }));
    Given(/^And "(.*)" has self-evaluated himself with "(.*)", "(.*)", "(.*)", "(.*)", "(.*)"$/, (name, goal1, goal2, goal3, goal4, goal5) => __awaiter(this, void 0, void 0, function* () {
        var arr = [];
        arr.push(goal1);
        arr.push(goal2);
        arr.push(goal3);
        arr.push(goal4);
        arr.push(goal5);
        var allnames = protractor_1.element.all(protractor_1.by.name('namelist'));
        yield allnames;
        var samenames = allnames.filter(elem => elem.getText().then(text => text === name));
        yield samenames;
        yield samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        // garantindo que vejo as metas que devo ver em pedro auto-avaliado
        for (var i = 0; i < 5; i += 1) {
            yield expect(sameMeta(samenames.first(), 'selfgoal' + i, arr[i])).to.eventually.equal(true);
        }
    }));
    Then(/^I can see the list alunos discrepantes as empty$/, () => __awaiter(this, void 0, void 0, function* () {
        var discrepanteslist = protractor_1.element.all(protractor_1.by.name('discrepanteslist'));
        yield discrepanteslist;
        yield discrepanteslist.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(0));
    }));
    Then(/^I can see "(\d*)" in total de alunos discrepantes$/, (total) => __awaiter(this, void 0, void 0, function* () {
        var tot = protractor_1.element(protractor_1.by.name('discrepantetotal'));
        yield tot;
        yield expect(tot.getText().then(text => text === total)).to.eventually.equal(true);
    }));
    Then(/^I can see "(\d*)"% in porcentagem de alunos discrepantes.$/, (pctg) => __awaiter(this, void 0, void 0, function* () {
        var pc = protractor_1.element(protractor_1.by.name('pctgtotal'));
        yield pc;
        yield expect(pc.getText().then(text => text === pctg)).to.eventually.equal(true);
    }));
    Then(/^I can see the list alunos discrepantes with only "(.*)"$/, (name) => __awaiter(this, void 0, void 0, function* () {
        var discrepanteslist = protractor_1.element.all(protractor_1.by.name('discrepanteslist'));
        yield discrepanteslist;
        yield discrepanteslist.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
        var samenames = discrepanteslist.filter(elem => elem.getText().then(text => text === name));
        yield samenames;
        yield samenames.then(elems => expect(Promise.resolve(elems.length)).to.eventually.equal(1));
    }));
    Then(/^I can see "(.*)" below the list.$/, (msg) => __awaiter(this, void 0, void 0, function* () {
        var mensagem = protractor_1.element(protractor_1.by.name('mensagem'));
        yield mensagem;
        yield expect(mensagem.getText().then(text => text === msg)).to.eventually.equal(true);
    }));
});
