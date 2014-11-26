<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Use Fudge with the Grub 2 bootloader</h1>
        <p>Add an entry to grub.cfg:</p>
        <pre>
menuentry "Fudge" {
    multiboot /fudge
    module /initrd.tar
    boot
}
        </pre>
    </xsl:template>
</xsl:stylesheet>
