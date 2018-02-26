const ExtractTextPlugin = require("extract-text-webpack-plugin");
const path = require('path');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')


const extractSass = new ExtractTextPlugin({
  filename: "css/main.css",
  disable: process.env.NODE_ENV === "development"
});
const uglifyJs = new UglifyJsPlugin({
  sourceMap: true
});


module.exports = {
  entry: './assets/js/main.js',
  devtool: 'source-map',
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: extractSass.extract({
          use: [
            {
              loader: "css-loader", options: {
                sourceMap: true
              },
            }, {
              loader: "sass-loader", options: {
                sourceMap: true
              }
            }
          ],
          fallback: "style-loader"  // use style-loader in development
        })
      }, {
        test: /\.(ttf|eot|svg|woff|woff2)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: {
          loader: 'file-loader?name=fonts/[name].[ext]'
//	  { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
//        { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" }
        }
      }
    ]
  },
  output: {
    filename: 'js/main.js',
    path: path.resolve(__dirname, 'public/assets'),
    publicPath: '/assets/'
  },
  plugins: [
    extractSass,
    uglifyJs,
  ]
};
