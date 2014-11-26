XML:=data.xml
BUILD:=build
XSL_INDEX:=$(BUILD)/index.html
XSL_BUILD:=$(BUILD)/build-crosscompiler-arm.html $(BUILD)/build-crosscompiler-x86.html $(BUILD)/build-fudge-arm.html $(BUILD)/build-fudge-x86.html $(BUILD)/build.html
XSL_EXTRA:=$(BUILD)/articles.html $(BUILD)/grub.html $(BUILD)/grub2.html $(BUILD)/install.html $(BUILD)/irc.html $(BUILD)/license.html $(BUILD)/overview.html $(BUILD)/source.html $(BUILD)/qemu-arm.html $(BUILD)/qemu-x86.html
CSS_STYLE:=$(BUILD)/style.css

all: $(BUILD) $(XSL_INDEX) $(XSL_BUILD) $(XSL_EXTRA) $(CSS_STYLE)

clean:
	rm -rf $(BUILD)

$(BUILD):
	mkdir -p $@

$(BUILD)/articles.html: articles.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/build-crosscompiler-arm.html: build-crosscompiler.xsl
	xsltproc -o $@ --stringparam arch arm $< $(XML)

$(BUILD)/build-crosscompiler-x86.html: build-crosscompiler.xsl
	xsltproc -o $@ --stringparam arch x86 $< $(XML)

$(BUILD)/build-fudge-arm.html: build-fudge.xsl
	xsltproc -o $@ --stringparam arch arm $< $(XML)

$(BUILD)/build-fudge-x86.html: build-fudge.xsl
	xsltproc -o $@ --stringparam arch x86 $< $(XML)

$(BUILD)/build.html: build.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/grub.html: grub.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/grub2.html: grub2.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/index.html: index.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/install.html: install.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/irc.html: irc.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/license.html: license.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/overview.html: overview.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/source.html: source.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/qemu-arm.html: qemu.xsl
	xsltproc -o $@ --stringparam arch arm $< $(XML)

$(BUILD)/qemu-x86.html: qemu.xsl
	xsltproc -o $@ --stringparam arch x86 $< $(XML)

$(BUILD)/style.css: style.css
	cp $< $@

