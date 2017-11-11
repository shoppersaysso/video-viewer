var webpack = require('webpack');
var path = require('path');

module.exports = {
  devtool: 'inline-source-map',
  entry: [
      'webpack-dev-server/client?http://127.0.0.1:8080/',
      'webpack/hot/only-dev-server',
      './src'
  ],
  output: {
      path: path.join(__dirname, 'public'),
      filename: 'bundle.js'
  },
  resolve: {
      modules: ['node_modules', 'src'],
      extensions: ['.js', '.jsx']
},
module: {
    rules: [
    {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: ['react-hot-loader', 'babel-loader']
    }
    ]
},

plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoEmitOnErrorsPlugin()
  ]
}
