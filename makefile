all: CryEd.gb

CryEd.gb: CryEd.o
	rgblink -p 255 -o $@ $^ -n CryEd.sym
	rgbfix -v -p 255 $@

CryEd.o:
	rgbasm -o $@ -p 255 Main.asm

clean:
	rm -rf CryEd.o CryEd.gb CryEd.sym
