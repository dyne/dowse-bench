
all:	compile test


compile: wrk 

test: dns_internal dns_external  webui
	@echo "DONE"

webui:
	@./webui_bench.sh

dns_internal:
	@./dns-internal_bench.sh

dns_external:
	@./dns-external_bench.sh

clean:
	rm -f *~

wrk:
	make -C wrk 

.PHONY: wrk 

