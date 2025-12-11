// tests/cucumber.js
module.exports = {
  default: {
    paths: ['features/**/*.feature'],
    require: ['steps/**/*.ts'],
    requireModule: ['ts-node/register'],
    format: ['progress'],
    strict: false,
    parallel: 2,
  },
};