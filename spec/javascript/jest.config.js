module.exports = {
  verbose: true,

  rootDir: '../../',

  roots: [
    'spec/javascript',
  ],

  moduleDirectories: [
    'node_modules',
    '<rootDir>/app/javascript',
  ],

  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/app/javascript/$1',
  },

  moduleFileExtensions: [
    'js',
    'json',
    'vue',
  ],

  transform: {
    '^.+\\.js$': '<rootDir>/node_modules/babel-jest',
    "^.*\\.(vue)$": '<rootDir>/node_modules/vue-jest',
  },

  testPathIgnorePatterns: [
    '/config/webpack/',
  ],
}
