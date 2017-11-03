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
cucumber_1.defineSupportCode(function ({ Given, When, Then }) {
    Given(/^eu estou na página "Autoavaliação"$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.browser.get("http://localhost:4200/");
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
        yield protractor_1.$("a[name='autoavaliacao']").click();
    }));
    When(/^eu estiver logado com cpf [^\"]* $/, (cpf) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='cpfbox']").sendKeys(name);
    }));
    When(/^eu preencher o campo [^\"]* com [^\"]*"$/, (conceito, meta) => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("td[name=conceito]").$("input[value=meta]").click();
    }));
    When(/^eu tentar enviar uma autoavaliação$/, () => __awaiter(this, void 0, void 0, function* () {
        yield protractor_1.$("input[name='enviarAutoavaliacao']").click();
    }));
    Then(/^serei redirecionado para a página inicial$/, () => __awaiter(this, void 0, void 0, function* () {
        yield expect(protractor_1.browser.getTitle()).to.eventually.equal('TaGui');
    }));
    Then(/^aparecerá uma mensagem de confirmação$/, () => __awaiter(this, void 0, void 0, function* () {
        protractor_1.browser.ignoreSynchronization = true;
        protractor_1.browser.switchTo().alert().accept();
    }));
    Then(/^aparecerá uma mensagem de erro$/, () => __awaiter(this, void 0, void 0, function* () {
        protractor_1.browser.ignoreSynchronization = true;
        protractor_1.browser.get('URL');
        protractor_1.browser.switchTo().alert().accept();
    }));
});
