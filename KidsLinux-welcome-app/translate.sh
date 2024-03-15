#!/bin/sh

#intltool-extract --type=gettext/glade welcome.wxg
xgettext -v --from-code=UTF-8 --language=Python --keyword=_ --keyword=N_ \
    --msgid-bugs-address=i18n@kidslinux.org \
    --package-name=kidslinux-welcome-app \
    --default-domain=kidslinux-welcome-app \
    --output-dir=po --output=welcome.pot \
    kidslinux-welcome-app.py

cd po/
sed -i 's/CHARSET/UTF-8/' welcome.pot
#msginit --locale=de_DE --input=welcome.pot --no-translator 
while IFS= read -r line; do
    #msginit --locale=$line --input=welcome.pot --no-translator ;
    echo -n "$line: "
    msgfmt -v $line.po -o $line.mo ;
done < LINGUAS

#msginit --locale=ru --input=show_form.pot
#msginit --locale=en_US --input=show_form.pot
#msginit --locale=de_DE --input=show_form.pot

#msgfmt ru.po -o locale/ru/LC_MESSAGES/show_form.mo
#msgfmt en_US.po -o locale/en_US/LC_MESSAGES/show_form.mo

mkdir -p /data/kidslinux/releng-kidslinux/airootfs/usr/share/locale/de/LC_MESSAGES
mkdir -p  /data/kidslinux/releng-kidslinux/airootfs/usr/share/locale/en/LC_MESSAGES
#msgfmt de.po -o de.mo
#cp -vr locale/*/ /data/kidslinux/releng-kidslinux/airootfs/usr/share/locale/
sudo cp -v de.mo /data/kidslinux/releng-kidslinux/airootfs/usr/share/locale/de/LC_MESSAGES/kidslinux-welcome-app.mo
sudo cp -v en.mo /data/kidslinux/releng-kidslinux/airootfs/usr/share/locale/en/LC_MESSAGES/kidslinux-welcome-app.mo
sudo cp -v de.mo /usr/share/locale/de/LC_MESSAGES/kidslinux-welcome-app.mo
sudo cp -v en.mo /usr/share/locale/en/LC_MESSAGES/kidslinux-welcome-app.mo
cd ..
cp -v kidslinux-welcome-app.py /data/kidslinux/releng-kidslinux/airootfs/usr/share/kidslinux-welcome-app/
