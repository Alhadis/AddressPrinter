src := ./send.to

all: clean result.ps

n:
	@nroff -C $(src) | less

%.ps:
	@rm -rf $@
	@groff -C -P-l $(src) > $@
	@osascript close.scpt $*
	@open $@

clean:
	@rm -rf $(wildcard *.pdf) $(wildcard *.ps)

.PHONY: clean n
