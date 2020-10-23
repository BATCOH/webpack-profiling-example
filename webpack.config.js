const path = require("path");
const webpack = require("webpack");
const HtmlWebPackPlugin = require("html-webpack-plugin");

module.exports = {
  entry: "./src/index.js",
  output: {
    filename: "bundle.js?v=[fullhash]",
    path: path.resolve(__dirname, "dist")
  },
  devServer: {
    port: 3000,
  },
  plugins: [
    new webpack.debug.ProfilingPlugin(),
    new HtmlWebPackPlugin({
      template: "./src/index.html",
      filename: "./index.html",
      inject: "body",
    })
  ]
};
