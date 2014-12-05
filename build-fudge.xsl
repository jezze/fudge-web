<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Building Fudge (<xsl:value-of select="$arch"/>)</h1>
        <h3>Prerequisities</h3>
        <p><a><xsl:attribute name="href">build-crosscompiler-<xsl:value-of select="$arch"/>.html</xsl:attribute>Building a cross-compiler (<xsl:value-of select="$arch"/>)</a>.</p>
        <h3>Get the source</h3>
        <p>Fudge is hosted on github. Clone the source code using git and cd into the cloned folder:</p>
        <pre>
$ git clone git://github.com/jezze/fudge.git
$ cd fudge
        </pre>
        <h3>Set the PATH environment variable</h3>
        <p>In this example the cross-compiler was installed in /home/foo/x-tools/<xsl:value-of select="/data/architectures/architecture[@id = $arch]/target"/>/. Change this to match your setup. If you haven't made any major modifications you just need to change foo to your username.</p>
        <pre>
$ export PATH=/home/foo/x-tools/<xsl:value-of select="/data/architectures/architecture[@id = $arch]/target"/>/bin:$PATH
        </pre>
        <p>IMPORTANT: The PATH modifications will be gone as soon as you leave the current session or start another. This means that you will need to reset it from time to time.</p>
        <h3>Building</h3>
        <pre>$ make ARCH=<xsl:value-of select="$arch"/></pre>
        <p>You should now have a binary called fudge and an initrd.tar file in the top folder.</p>
        <h2>Next step</h2>
        <p><a><xsl:attribute name="href">qemu-<xsl:value-of select="$arch"/>.html</xsl:attribute>Running Fudge in QEMU (<xsl:value-of select="$arch"/>)</a>.</p>
        <xsl:if test="$arch = 'x86'">
            <p><a href="install.html">Installing Fudge on a physical machine</a>.</p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
