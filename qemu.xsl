<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Running Fudge in QEMU (<xsl:value-of select="$arch"/>)</h1>
        <p>QEMU is a really fast and fairly accurate emulator for various architectures. It is easier to test Fudge in QEMU than to install it on a real machine every time you make a change.</p>
        <h3>Prerequisities</h3>
        <p><a><xsl:attribute name="href">build-fudge-<xsl:value-of select="$arch"/>.html</xsl:attribute>Building Fudge (<xsl:value-of select="$arch"/>)</a>.</p>
        <h3>Running</h3>
        <p>Start emulation:</p>
        <xsl:choose>
            <xsl:when test="$arch = 'arm'">
                <pre>
$ qemu-system-arm -machine integratorcp -m 128 -kernel fudge -initrd initrd.tar -serial stdio
                </pre>
                <p>NOTICE: Fudge currently only targets the integratorcp platform.</p>
            </xsl:when>
            <xsl:when test="$arch = 'x86'">
                <pre>
$ qemu-system-x86 -kernel fudge -initrd initrd.tar
                </pre>
                <p>Possible extra options that Fudge supports:</p>
                <pre>
-serial stdio
-vga std
-net nic,model=rtl8139 -net tap,script=no,downscript=no,ifname=tap0
                </pre>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
