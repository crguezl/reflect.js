
require('./reflect-parse.js');
require('./stringify-test.js');

if (require.main === module)
    require("test").run(exports);
