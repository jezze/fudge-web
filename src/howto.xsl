<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Howto</h1>
        <h3>Building</h3>
        <ul>
            <xsl:for-each select="/data/architectures/architecture[@id='x86']">
                <li><a><xsl:attribute name="href">build-crosscompiler-<xsl:value-of select="@id"/>.html</xsl:attribute>Building a cross-compiler (<xsl:value-of select="@id"/>)</a></li>
                <li><a><xsl:attribute name="href">build-fudge-<xsl:value-of select="@id"/>.html</xsl:attribute>Building Fudge (<xsl:value-of select="@id"/>)</a></li>
            </xsl:for-each>
        </ul>
        <h3>Emulating</h3>
        <ul>
            <xsl:for-each select="/data/architectures/architecture[@id='x86']">
                <li><a><xsl:attribute name="href">qemu-<xsl:value-of select="@id"/>.html</xsl:attribute>Running Fudge in QEMU (<xsl:value-of select="@id"/>)</a></li>
            </xsl:for-each>
        </ul>
        <h3>Installing</h3>
        <ul>
            <li><a><xsl:attribute name="href">install.html</xsl:attribute>Installing Fudge on a physical machine</a></li>
            <li><a><xsl:attribute name="href">grub.html</xsl:attribute>Use Fudge with the Grub legacy bootloader</a></li>
            <li><a><xsl:attribute name="href">grub2.html</xsl:attribute>Use Fudge with the Grub 2 bootloader</a></li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
