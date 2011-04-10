GRAM=lang.cf
EXAMPLE="examples/example.cpp"

all: compile3 run

compile1:
	bnfc -p Syntax -haskell $(GRAM)

compile2: compile1
	happy -gca Parlang.y
	alex -g Lexlang.x
	latex Doclang.tex
	dvips Doclang.dvi -o Doclang.ps
	ghc --make Testlang.hs -o Testlang

compile3: compile2
	ghc --make Main.hs -o Main

run:
	./Main $(EXAMPLE)

clean:
	 rm -f *.log *.aux *.hi *.o *.dvi Doclang.ps *.o
distclean: clean
	 rm -f Doclang.* Lexlang.* Parlang.* ParlangData.* Layoutlang.* Skellang.* Printlang.* Testlang.* Abslang.* Testlang ErrM.* SharedString.* lang.dtd XMLlang.* Main
