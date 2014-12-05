<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Howto</h1>
        <h2>Building Fudge from source</h2>
        <h3>Building a cross-compiler</h3>
        <p>This guide shows you how to build a cross-compiler for a specific target. The cross-compiler is needed to compile Fudge.</p>
        <ul>
            <xsl:for-each select="/data/architectures/architecture">
                <li><a><xsl:attribute name="href">build-crosscompiler-<xsl:value-of select="@id"/>.html</xsl:attribute>Building a cross-compiler (<xsl:value-of select="@id"/>)</a></li>
            </xsl:for-each>
        </ul>
        <h3>Building Fudge</h3>
        <p>This guide shows you how to build Fudge using a cross-compiler.</p>
        <ul>
            <xsl:for-each select="/data/architectures/architecture">
                <li><a><xsl:attribute name="href">build-fudge-<xsl:value-of select="@id"/>.html</xsl:attribute>Building Fudge (<xsl:value-of select="@id"/>)</a></li>
            </xsl:for-each>
        </ul>
        <h2>Running Fudge</h2>
        <h3>Inside an emulator</h3>
        <p>This guide shows you how to run Fudge in QEMU.</p>
        <ul>
            <xsl:for-each select="/data/architectures/architecture">
                <li><a><xsl:attribute name="href">qemu-<xsl:value-of select="@id"/>.html</xsl:attribute>Running Fudge in QEMU (<xsl:value-of select="@id"/>)</a></li>
            </xsl:for-each>
        </ul>
        <h3>On real hardware</h3>
        <p>These guides are geared towards x86.</p>
        <ul>
            <li><a><xsl:attribute name="href">install.html</xsl:attribute>Installing Fudge on a physical machine</a></li>
            <li><a><xsl:attribute name="href">grub.html</xsl:attribute>Use Fudge with the Grub legacy bootloader</a></li>
            <li><a><xsl:attribute name="href">grub2.html</xsl:attribute>Use Fudge with the Grub 2 bootloader</a></li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
