#!/bin/zsh

terser --ecma 2015 -c toplevel,sequences=false,drop_console=true --mangle -- ./build/node_modules/react-dom/umd/react-dom.production.es6.min.js > ./build/node_modules/react-dom/umd/react-dom.production.es6.terser.min.js
terser -c drop_console=true --mangle -- ./build/node_modules/react-dom/umd/react-dom.production.min.js > ./build/node_modules/react-dom/umd/react-dom.production.terser.min.js

# из es5 в es6
terser -c drop_console=true --mangle -- ./build_master/node_modules/react-dom/umd/react-dom.production.min.js > ./build_master/node_modules/react-dom/umd/react-dom.production.terser.min.js


gzip -k --best ./build/node_modules/react-dom/umd/*.min.js
gzip -k --best ./build_master/node_modules/react-dom/umd/*.min.js

brotli -k --best ./build/node_modules/react-dom/umd/*.min.js
brotli -k --best ./build_master/node_modules/react-dom/umd/*.min.js

#yarn es-check --module es2017 ./build/node_modules/react-dom/umd/react-dom.production.es6.terser.min.js
#yarn es-check --module es5 ./build/node_modules/react-dom/umd/react-dom.production.terser.min.js
