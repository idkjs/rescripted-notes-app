const path = require('path');

module.exports = {
  entry: {
    main: './lib/js/src/main.bs.js',
  },
  output: {
    path: path.join(__dirname, "bundledOutputs"),
    filename: '[name].js',
  },
};
