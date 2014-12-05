<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Building a cross-compiler (<xsl:value-of select="$arch"/>)</h1>
        <p>In order to compile Fudge for <xsl:value-of select="$arch"/> we need to create a cross-compiler. Building a cross-compiler can be a tedious task but luckily there is tool called <a href="http://www.crosstool-ng.org/">crosstool-ng</a> that automates the entire process for us. Even if you happen to be using the same platform as we are targeting you should still build a cross-compiler because the tools that ships with your operating system might have been specifically configured for your system. When compiling Fudge, we must use a barebone compiler.</p>
        <h3>Installing</h3>
        <p>Download and install crosstool-ng. The recommended version is <xsl:value-of select="/data/crosstool-ng/@version"/>.</p>
        <pre>
$ wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-<xsl:value-of select="/data/crosstool-ng/@version"/>.tar.bz2
$ tar xjf crosstool-ng-<xsl:value-of select="/data/crosstool-ng/@version"/>.tar.bz2
$ cd crosstool-ng-<xsl:value-of select="/data/crosstool-ng/@version"/>
$ ./configure
$ make
# make install
        </pre>
        <p>The last command must probably be run as root.</p>
        <h3>Configuring</h3>
        <p>Create a folder in your home directory called temp and cd to it.</p>
        <pre>
$ mkdir ~/temp
$ cd ~/temp
        </pre>
        <p>Configure the cross-compiler environment by running:</p>
        <pre>
$ ct-ng menuconfig
        </pre>
        <p>This will start the configuration program. Set the target architecture to <xsl:value-of select="$arch"/>. Select:</p>
        <pre>
Target options -> Target Architecture -> <xsl:value-of select="$arch"/>
        </pre>
        <p>By default the cross-compiler will be installed in ~/x-tools/<xsl:value-of select="/data/architectures/architecture[@id = $arch]/target"/>/. You can change this if you want. Please refer to the <a href="http://www.crosstool-ng.org/">crosstool-ng website</a> for more information on how to customize your setup.</p>
        <p>Exit the configuration tool by pressing exit a few times. Before you leave the last screen you will be asked if you want to save these settings. Press yes.</p>
        <h3>Building</h3>
        <p>Start to build the cross-compiler:</p>
        <pre>
$ ct-ng build
        </pre>
        <p>Depending on your system this may take some time, usually around 10-15 minutes. Grab a coffee.</p>
        <h2>Next step</h2>
        <p><a><xsl:attribute name="href">build-fudge-<xsl:value-of select="$arch"/>.html</xsl:attribute>Building Fudge (<xsl:value-of select="$arch"/>)</a>.</p>
    </xsl:template>
</xsl:stylesheet>
