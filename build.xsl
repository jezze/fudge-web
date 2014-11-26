<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:param name="arch"/>
    <xsl:template name="main">
        <h1>Build</h1>
        <p>This guide will show you:</p>
        <ul>
            <li>How to create a cross-compiler using crosstool-ng.</li>
            <li>How to build Fudge using the cross-compiler we just created.</li>
        </ul>
        <h2>Prerequisities</h2>
        <p>To build Fudge you need to have a Unix compatible system like Linux or *BSD. You also need the basic development tools that usually ship with your distribution.</p>
        <h2>Building a cross-compiler</h2>
        <ul>
        <xsl:for-each select="/data/architectures/architecture">
            <li><a><xsl:attribute name="href">build-crosscompiler-<xsl:value-of select="@id"/>.html</xsl:attribute>Building a cross-compiler (<xsl:value-of select="@id"/>)</a></li>
        </xsl:for-each>
        </ul>
        <h2>Building Fudge</h2>
        <ul>
        <xsl:for-each select="/data/architectures/architecture">
            <li><a><xsl:attribute name="href">build-fudge-<xsl:value-of select="@id"/>.html</xsl:attribute>Building Fudge (<xsl:value-of select="@id"/>)</a></li>
        </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
