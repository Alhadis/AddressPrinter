src := send.to

all: clean result.ps

# Alias for `make send.to`
template: $(src)

n:
	@nroff -C $(src) | less

%.ps:
	@rm -rf $@
	@groff -C -P-l $(src) > $@
	@osascript close.scpt $*
	@open $@

$(src):
	@rm -rf $(src)
	@groff -C -Tascii addr-template.1 > $@
	@perl -0777 -pi -e 's/\s+$$/\n/' $@

clean:
	@rm -rf $(wildcard *.pdf) $(wildcard *.ps)

.PHONY: clean n $(src)
