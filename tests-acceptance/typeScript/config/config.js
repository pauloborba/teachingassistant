"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const protractor_1 = require("protractor");
exports.config = {
    seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    SELENIUM_PROMISE_MANAGER: false,
    capabilities: {
        browserName: 'chrome',
        version: "70.0.3538.67",
        chromeOptions: { binary: '/home/CIN/sgfl/.local/opt/google/chrome/google-chrome' }
    },
    framework: 'custom',
    frameworkPath: require.resolve('protractor-cucumber-framework'),
    specs: [
        '../../features/*.feature'
    ],
    onPrepare: () => {
        protractor_1.browser.ignoreSynchronization = true;
        protractor_1.browser.manage().window().maximize();
    },
    cucumberOpts: {
        compiler: "ts:ts-node/register",
        strict: true,
        format: ['pretty'],
        require: ['../../stepdefinitions/*.ts'],
    }
};
