<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Building Fudge from source</h1>
        <h2>Prerequisities</h2>
        <p>To try Fudge you need a Unix compatible system like Linux or *BSD.</p>
        <p>To compile and run Fudge you need to have the following tools installed.</p>
        <ul>
            <li>clang (compile and link)</li>
            <li>qemu or bochs (emulator)</li>
        </ul>
        <h2>Building</h2>
        <p>At the moment Fudge only runs properly on x86 using a multiboot compliant loader but there are other loaders and architectures under development.</p>
        <h3>Architecture: x86</h3>
        <p>To compile for x86 you write:</p>
        <pre>$ make</pre>
        <p>To clean for x86 you write:</p>
        <pre>$ make clean</pre>
        <h3>Architecture: ARM</h3>
        <p>To compile for ARM you write:</p>
        <pre>$ make ARCH=arm LOADER=versatilepb</pre>
        <p>To clean for ARM you write:</p>
        <pre>$ make ARCH=arm LOADER=versatilepb clean</pre>
        <p>It is possible to edit the Makefile and set the ARCH and LOADER variable directly so you don't need to supply it every time you compile.</p>
        <h2>Installing</h2>
        <p>Simply run:</p>
        <pre>$ make install [ INSTALL_PATH=/boot ]</pre>
        <p>This will copy fudge and initrd.tar to your /boot folder.</p>
        <h2>References</h2>
        <ul>
            <li><a href="grub.html">Configure Grub</a></li>
            <li><a href="grub2.html">Configure Grub 2</a></li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
