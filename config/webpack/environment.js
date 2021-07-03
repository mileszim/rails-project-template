const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
const fs = require('fs');
const yaml = require('js-yaml');

// dotenv
const dotenv = require('dotenv');
const dotenvFiles = [
  `.env.${process.env.NODE_ENV}.local`,
  '.env.local',
  `.env.${process.env.NODE_ENV}`,
  '.env',
];
dotenvFiles.forEach((dotenvFile) => {
  dotenv.config({ path: dotenvFile, silent: true });
});
environment.plugins.insert(
  'Environment',
  new webpack.EnvironmentPlugin(process.env),
);

// settings
const allSettings = yaml.load(fs.readFileSync('config/settings.yml', 'utf8'));
const settings = { ...allSettings["shared"], ...allSettings[process.env.NODE_ENV] };

environment.plugins.insert(
  'Environment',
  new webpack.EnvironmentPlugin(settings),
);

// Inject and Export
const customConfig = require('./custom');
environment.config.merge(customConfig);

module.exports = environment;
