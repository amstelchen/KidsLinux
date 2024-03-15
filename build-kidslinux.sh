#!/bin/sh
figlet -w 120 -f3d KidsLinux | lolcat -f -S 666 > assets/logo.ans
cp -v assets/logo.ans releng-kidslinux/airootfs/etc/motd
figlet -w 120 -f3d KidsLinux | lolcat -f -S 666 | textimg -b white -o assets/logo.png
# cp -v assets/logo.png releng-kidslinux/syslinux/splash.png
cp -v assets/kidslinux-logo.png releng-kidslinux/airootfs/usr/share/icons/kidslinux-logo.png
cp -v assets/kidslinux-logo-128px.png releng-kidslinux/airootfs/usr/share/icons/kidslinux-logo-128px.png
cp -v assets/kidslinux-logo.png releng-kidslinux/airootfs/usr/share/pixmaps/kidslinux-logo.png
cp -v assets/kidslinux-logo-128px.png releng-kidslinux/airootfs/usr/share/pixmaps/kidslinux-logo-128px.png
sudo rm -rf /tmp/archiso-tmp
sudo mkarchiso -v -w /tmp/archiso-tmp -o ./output releng-kidslinux/
cd output
echo "Adding checksums..."
b2sum "kidslinux-$(date +%Y.%m.01)-x86_64.iso" >> b2sums.txt
md5sum "kidslinux-$(date +%Y.%m.01)-x86_64.iso" >> md5sums.txt
sha1sum "kidslinux-$(date +%Y.%m.01)-x86_64.iso" >> sha1sums.txt
sha256sum "kidslinux-$(date +%Y.%m.01)-x86_64.iso" >> sha256sums.txt
# rm "kidslinux-$(date +%Y.%m.01)-x86_64.iso.asc"
gpg --y --detach-sign -a "kidslinux-$(date +%Y.%m.01)-x86_64.iso"
gpg --y --export --armor --output kidslinux-public-key.asc "Michael John (KidsLinux Signing Key) <kidslinux@kidslinux.org>"
