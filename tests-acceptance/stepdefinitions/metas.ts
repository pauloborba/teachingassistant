import { defineSupportCode } from 'cucumber';
import { browser, $, element, ElementArrayFinder, by } from 'protractor';
import { async } from 'q';
let chai = require('chai').use(require('chai-as-promised'));
let expect = chai.expect;

defineSupportCode(function ({ Given, When, Then }) {
    Given('estou na página de metas', async() => {
        // Write code here that turns the phrase above into concrete actions
    });

    Given('não vejo uma meta de nome {nomeDaMeta}', async (nomeDaMeta) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('preencho o campo {nomeDoCampo} com {nomeDaMeta}', async (nomeDoCampo, nomeDaMeta) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('confirmo a criação', async () => {
        // Write code here that turns the phrase above into concrete actions
    });

    Then('posso ver a meta de nome {nomeDaMeta} listada', async (nomeDaMeta) => {
        // Write code here that turns the phrase above into concrete actions
    });

    Then('posso ver a meta de nome {nomeDaMeta} listada apenas {qtdMeta} vez', async (nomeDaMeta, qtdMeta) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('preencho o campo {nomeDoCampo} com nome ""', async (nomeDoCampo) => {
        // Write code here that turns the phrase above into concrete actions
    });

    Then('não posso ver a meta de nome ""', async () => {
        // Write code here that turns the phrase above into concrete actions
    });

    Given('seleciono a meta com nome {nomeDaMeta}', async (nomeDaMeta) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('confirmo a edição', async () => {
        // Write code here that turns the phrase above into concrete actions
    });

    Then('não posso ver a meta de nome {stringInDoubleQuotes}', async (stringInDoubleQuotes) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('seleciono a opção {stringInDoubleQuotes}', async (stringInDoubleQuotes) => {
        // Write code here that turns the phrase above into concrete actions
    });

    When('confirmo a remoção', async () => {
        // Write code here that turns the phrase above into concrete actions
    });
});