addresses := send.to
target    := result.ps

all: $(addresses) $(target)


# Generate PostScript file from address template
$(target): $(addresses)
	@groff -C -P-l $^ > $@


# Generate an address template from user-supplied input
$(addresses):
	@groff -C -Tascii addr-template.1 > $@
	@hash perl 2>/dev/null && perl -0777 -pi -e 's/\s+$$/\n/; s/^(\.TO:[ \t]*)\n{1,}/$$1\n/gms;' $@ || true


# Delete generated files
clean:
	@rm -f $(addresses) $(target)



# Open the generated PostScript file in Preview
.PHONY: preview
preview: $(addresses) $(target)
	@osascript close.scpt $(basename $(target)) 2>/dev/null || true
	@open $(target)


# Show approximation of output using nroff
tty:
	@nroff -C $(addresses) | less
