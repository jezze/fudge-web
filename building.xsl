<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="common.xsl"/>
    <xsl:template name="main">
        <h1>Building Fudge</h1>
        <h2>Overview</h2>
        <p>To compile and run Fudge you need to complete the following 3 steps:</p>
        <ul>
            <li>1. Create a cross-compiler using crosstool-ng.</li>
            <li>2. Build Fudge using the cross-compiler.</li>
            <li>3a. Use QEMU to virtualize Fudge.</li>
            <li>3b. Install Fudge on real hardware.</li>
        </ul>
        <p>NOTICE #1: Even though the ARM port is referenced in this document it is still undergoing heavy development and is not as full-featured as the x86 port.</p>
        <p>NOTICE #2: This document contains optional sections depending on what type of architecture you are building for. Follow only one of them.</p>
        <h2>Prerequisities</h2>
        <p>To build Fudge you need to have a Unix compatible system like Linux or *BSD. You also need the basic development tools that usually ship with your distribution.</p>
        <h2>1. Create a cross compiler using crosstool-ng</h2>
        <p>In order to compile Fudge you first need to set up a cross-compiler on your computer. Thanks to <a href="http://www.crosstool-ng.org/">crosstool-ng</a> this is a really easy.</p>
        <p>First download and install crosstool-ng. This document uses version 1.20.0.</p>
        <pre>
$ wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.20.0.tar.bz2
$ tar xjf crosstool-ng-1.20.0.tar.bz2
$ cd crosstool-ng-1.20.0
$ ./configure
$ make
# make install
        </pre>
        <p>After installation is complete you should now have a ct-ng binary installed on your system.</p>
        <p>Now we need to configure the cross-compiler we are going to build. First create a folder with any name like temp and cd to it:</p>
        <pre>
$ mkdir temp
$ cd temp
        </pre>
        <h3>Optional: Target the x86 version of Fudge (recommended)</h3>
        <p>Create a default configuration by using the i386-unknown-elf sample:</p>
        <pre>
$ ct-ng i386-unknown-elf
        </pre>
        <p>By default the cross-compiler will be installed in /home/[USER]/x-tools/. If you do not want that, or you want to do any other modification, you can edit the configuration now by using ct-ng menuconfig. Please refer to the <a href="http://www.crosstool-ng.org/">crosstool-ng website</a> for more information.</p>
        <p>Now it is time to build the cross-compiler:</p>
        <pre>
$ ct-ng build
        </pre>
        <p>Depending on your system this can take some time. Grab a coffee.</p>
        <p>When everything is done, the last step you need to do before compiling Fudge is to add the /home/[USER]/x-tools/bin folder to your PATH variable. Make sure you replace [USER] with your username.</p>
        <pre>
$ export PATH=/home/[USER]/x-tools/i386-unknown-elf/bin:$PATH
        </pre>
        <p>Congratulations. You now have a working cross-compiler. Remember that the PATH variable you have changed will only work in the current shell you are using so if you open a new shell you need to export the PATH variable again.</p>
        <h3>Optional: Target the arm version of Fudge (not recommended)</h3>
        <p>Create a default configuration by using the arm-unknown-eabi sample:</p>
        <pre>
$ ct-ng arm-unknown-eabi
        </pre>
        <p>By default the cross-compiler will be installed in /home/[USER]/x-tools/. If you do not want that, or you want to do any other modification, you can edit the configuration now by using ct-ng menuconfig. Please refer to the <a href="http://www.crosstool-ng.org/">crosstool-ng website</a> for more information.</p>
        <p>Now it is time to build the cross-compiler:</p>
        <pre>
$ ct-ng build
        </pre>
        <p>Depending on your system this can take some time. Grab a coffee.</p>
        <p>When everything is done, the last step you need to do before compiling Fudge is to add the /home/[USER]/x-tools/bin folder to your PATH variable. Make sure you replace [USER] with your username.</p>
        <pre>
$ export PATH=/home/[USER]/x-tools/arm-unknown-eabi/bin:$PATH
        </pre>
        <p>Congratulations. You now have a working cross-compiler. Remember that the PATH variable you have changed will only work in the current shell you are using so if you open a new shell you need to export the PATH variable again.</p>
        <h2>2. Build Fudge using the cross-compiler</h2>
        <p>First you need to acquire the source code for Fudge. The simplest way is to clone it with git.</p>
        <pre>
$ git clone git://github.com/jezze/fudge.git
$ cd fudge
        </pre>
        <p>Building Fudge is really simple and quick. The only thing you need to do is to write make and set the ARCH flag to the architecture you are using. If left out, it will be x86.</p>
        <h3>Optional: If you are using the x86 cross-compiler</h3>
        <pre>$ make ARCH=x86</pre>
        <p>Thats it! You should now have a binary called fudge and an initrd.tar file in the base folder.</p>
        <h3>Optional: If you are using the arm cross-compiler</h3>
        <pre>$ make ARCH=arm</pre>
        <p>Thats it! You should now have a binary called fudge and an initrd.tar file in the base folder.</p>
        <h2>3a. Use QEMU to virtualize Fudge</h2>
        <p>QEMU is a really fast and accurate emulator for various architectures. It is a perfect tool to to test Fudge before installing it on a real machine.</p>
        <h3>Optional: If you have built the x86 version of Fudge</h3>
        <p>Start Fudge:</p>
        <pre>
$ qemu-system-x86 -kernel fudge -initrd initrd.tar
        </pre>
        <p>Possible extra options that fudge supports:</p>
        <pre>
-serial stdio
-vga std
-net nic,model=rtl8139 -net tap,script=no,downscript=no,ifname=tap0
        </pre>
        <h3>Optional: If you have built the arm version of Fudge</h3>
        <p>Start Fudge:</p>
        <pre>
$ qemu-system-arm -machine integratorcp -m 128 -kernel fudge -initrd initrd.tar -serial stdio
        </pre>
        <p>NOTICE: Fudge currently only targets the integratorcp</p>
        <h2>3b. Install Fudge on real hardware</h2>
        <p>This section is only specific to the x86 version of Fudge. Fudge can run perfectly well side by side next to whatever operating system you are using like Linux. Since Fudge is multiboot compliant you need to use a multiboot compliant bootloader like Grub Legacy or Grub 2.</p>
        <p>First either copy the fudge binary and the initrd.tar ramdisk to your boot folder or issue this command as root:</p>
        <pre>
$ make install [INSTALL_PATH=/boot]
        </pre>
        <p>This will copy fudge and initrd.tar to your /boot folder. Add the INSTALL_PATH variable if you happen to have your boot directory somewhere else.</p>
        <h3>Optional: Using Grub Legacy</h3>
        <p>Add an entry to menu.lst:</p>
        <pre>
title  Fudge
root   (hd0,0)
kernel /fudge
module /initrd.tar
        </pre>
        <h3>Optional: Using Grub 2</h3>
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
