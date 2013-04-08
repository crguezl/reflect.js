all: build test

build: move
	jison lib/grammar.y lib/lexer.l
	mv grammar.js dist/parser.js

move: lib
	cp lib/*.js dist/

test: move dist
	node test/all-tests.js

standalone: move dist
	node scripts/standalone.js | uglifyjs > standalone/reflect.js

node_modules: # make a link to test
	ln -s ../../jison-compiler/ebnf-parser/node_modules/test

print: 
	a2ps --columns=1 -f 8 -R lib/grammar.y  -o out.ps
	#a2ps --columns=1 -f 8 -R aSb_anotado.js -o out.ps

clean:
	rm -f out.ps out.pdf dist/*
