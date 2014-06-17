var jshint = require('jshint').JSHINT;
var fs = require('fs');
var code = fs.readFileSync(process.argv[2], {encoding: 'utf8'});

jshint(code);
console.log(JSON.stringify(jshint.data().errors));