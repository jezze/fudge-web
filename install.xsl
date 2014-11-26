<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Installing Fudge on a physical machine</h1>
        <p>The easiest way is to install Fudge on a real machine is to have it side by side with your current operating system and bootloader. Assuming you are running say Linux and have your boot partition in /boot you only need to run this as root:</p>
        <pre>
$ make install
        </pre>
        <p>This will copy fudge and initrd.tar to /boot. If your boot partition is somewhere else you can override the default /boot by adding the INSTALL_PATH variable:</p>
        <pre>
$ make INSTALL_PATH=/some/place/ install
        </pre>
        <h2>Next step</h2>
        <p><a href="grub.html">Use Fudge with the Grub legacy bootloader</a>.</p>
        <p><a href="grub2.html">Use Fudge with the Grub 2 bootloader</a>.</p>
    </xsl:template>
</xsl:stylesheet>
