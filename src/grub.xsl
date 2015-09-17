<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Use Fudge with the Grub legacy bootloader</h1>
        <p>Add an entry to menu.lst:</p>
        <pre>
title  Fudge
root   (hd0,0)
kernel /fudge
module /initrd.tar
        </pre>
    </xsl:template>
</xsl:stylesheet>
