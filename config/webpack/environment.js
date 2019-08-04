const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

/*
** CSS loader fixing issue, See https://github.com/rails/webpacker/issues/2162
*/
const cssLoader = environment.loaders.get('css')
cssLoader.use=[{'loader':'vue-style-loader'}, {'loader': 'css-loader'}];

module.exports = environment
