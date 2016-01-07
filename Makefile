DIR_SRC:=src
DIR_BUILD:=build
DIR_INSTALL:=/srv/http/fudgeos

XML:=data.xml
XSL:=$(DIR_BUILD)/index.html
XSL+=$(DIR_BUILD)/build-crosscompiler-arm.html $(DIR_BUILD)/build-crosscompiler-x86.html $(DIR_BUILD)/build-fudge-arm.html $(DIR_BUILD)/build-fudge-x86.html $(DIR_BUILD)/howto.html
XSL+=$(DIR_BUILD)/articles.html $(DIR_BUILD)/grub.html $(DIR_BUILD)/grub2.html $(DIR_BUILD)/install.html $(DIR_BUILD)/irc.html $(DIR_BUILD)/license.html $(DIR_BUILD)/overview.html $(DIR_BUILD)/source.html $(DIR_BUILD)/qemu-arm.html $(DIR_BUILD)/qemu-x86.html
CSS:=$(DIR_BUILD)/style.css

all: $(DIR_BUILD) $(XSL) $(CSS)

clean:
	rm -rf $(DIR_BUILD)

install: $(DIR_INSTALL)

$(DIR_BUILD):
	mkdir -p $@

$(DIR_BUILD)/%-arm.html: $(DIR_SRC)/%.xsl
	xsltproc -o $@ --stringparam arch arm $< $(XML)

$(DIR_BUILD)/%-x86.html: $(DIR_SRC)/%.xsl
	xsltproc -o $@ --stringparam arch x86 $< $(XML)

$(DIR_BUILD)/%.html: $(DIR_SRC)/%.xsl
	xsltproc -o $@ $< $(XML)

$(DIR_BUILD)/%.css: %.css
	cp $< $@

$(DIR_INSTALL): $(DIR_BUILD)
	mkdir -p $@
	cp $(DIR_BUILD)/* $@

