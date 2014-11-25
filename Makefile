XML:=data.xml
OUT:=build build/articles.html build/building.html build/fetching.html build/grub.html build/grub2.html build/index.html build/irc.html build/license.html build/overview.html build/style.css

all: $(OUT)

clean:
	rm -rf $(OUT)

build:
	mkdir -p $@

build/articles.html: articles.xsl
	xsltproc -o $@ $< $(XML)

build/building.html: building.xsl
	xsltproc -o $@ $< $(XML)

build/fetching.html: fetching.xsl
	xsltproc -o $@ $< $(XML)

build/grub.html: grub.xsl
	xsltproc -o $@ $< $(XML)

build/grub2.html: grub2.xsl
	xsltproc -o $@ $< $(XML)

build/index.html: index.xsl
	xsltproc -o $@ $< $(XML)

build/irc.html: irc.xsl
	xsltproc -o $@ $< $(XML)

build/license.html: license.xsl
	xsltproc -o $@ $< $(XML)

build/overview.html: overview.xsl
	xsltproc -o $@ $< $(XML)

build/style.css: style.css
	cp $< $@

