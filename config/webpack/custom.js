const path = require('path');
module.exports = {
  resolve: {
    alias: {
      '@/assets': path.resolve(__dirname, '..', '..', 'app/assets'),
      '@': path.resolve(
        __dirname,
        '..',
        '..',
        'app/javascript/src',
      ),
    },
  },
};
