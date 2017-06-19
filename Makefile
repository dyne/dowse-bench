
all:	compile test


compile: wrk dnsblast


test:
	@echo "TODO"

clean:
	rm -f *~

wrk:
	make -C wrk 

dnsblast:
	make -C dnsblast

.PHONY: wrk dnsblast
