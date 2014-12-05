XML:=data.xml
BUILD:=build
XSL_INDEX:=$(BUILD)/index.html
XSL_BUILD:=$(BUILD)/build-crosscompiler-arm.html $(BUILD)/build-crosscompiler-x86.html $(BUILD)/build-fudge-arm.html $(BUILD)/build-fudge-x86.html $(BUILD)/howto.html
XSL_EXTRA:=$(BUILD)/articles.html $(BUILD)/grub.html $(BUILD)/grub2.html $(BUILD)/install.html $(BUILD)/irc.html $(BUILD)/license.html $(BUILD)/overview.html $(BUILD)/source.html $(BUILD)/qemu-arm.html $(BUILD)/qemu-x86.html
CSS_STYLE:=$(BUILD)/style.css

all: $(BUILD) $(XSL_INDEX) $(XSL_BUILD) $(XSL_EXTRA) $(CSS_STYLE)

clean:
	rm -rf $(BUILD)

$(BUILD):
	mkdir -p $@

$(BUILD)/%-arm.html: %.xsl
	xsltproc -o $@ --stringparam arch arm $< $(XML)

$(BUILD)/%-x86.html: %.xsl
	xsltproc -o $@ --stringparam arch x86 $< $(XML)

$(BUILD)/%.html: %.xsl
	xsltproc -o $@ $< $(XML)

$(BUILD)/%.css: %.css
	cp $< $@

