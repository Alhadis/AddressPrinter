all: clean result.ps

%.ps:
	@rm -rf $@
	@groff -C -P-l ./send.to > $@
	@osascript close.scpt $*
	@open $@

clean:
	@rm -rf $(wildcard *.pdf) $(wildcard *.ps)

.PHONY: clean
