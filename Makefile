CATA = data/Segment
PROBLEM = atlantis
CASES = 10

default:
	make run

clean:
	rm -rf $(CATA)/$(PROBLEM)/data
	rm -rf $(CATA)/$(PROBLEM)/*.o
	rm -rf $(CATA)/$(PROBLEM)/generate
	rm -rf $(CATA)/$(PROBLEM)/std

run:
	make clean
	make compile
	make generate

compile:
	g++ -o $(CATA)/$(PROBLEM)/generate $(CATA)/$(PROBLEM)/generate.cpp -O2
	g++ -o $(CATA)/$(PROBLEM)/std $(CATA)/$(PROBLEM)/std.cpp -O2

generate:
	mkdir -p ./$(CATA)/$(PROBLEM)/data
	for i in {1..$(CASES)} ;\
	do \
		./$(CATA)/$(PROBLEM)/generate $$i > ./$(CATA)/$(PROBLEM)/data/$$i.in; \
		./$(CATA)/$(PROBLEM)/std < ./$(CATA)/$(PROBLEM)/data/$$i.in > ./$(CATA)/$(PROBLEM)/data/$$i.out; \
	done

new:
	mkdir -p ./$(CATA)/$(PROBLEM)
	echo '' > ./$(CATA)/$(PROBLEM)/std.cpp
	cp template.md ./$(CATA)/$(PROBLEM)/problem.md
	cp generate.cpp ./$(CATA)/$(PROBLEM)/generate.cpp
	