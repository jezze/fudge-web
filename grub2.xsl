<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Using Grub 2</h1>
        <p>If you use Grub 2 add an entry to grub.cfg:</p>
        <pre>
menuentry "Fudge" {
    multiboot /fudge
    module /initrd.tar
    boot
}
        </pre>
    </xsl:template>
</xsl:stylesheet>
