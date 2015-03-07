all:

test: force
	./help2md test/basic/input.txt | diff test/basic/expected.txt -
	./help2md test/continuation/input.txt | diff test/continuation/expected.txt -

force:
