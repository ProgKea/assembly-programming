run: hello
	./hello

hello: hello.fasm
	fasm hello.fasm
