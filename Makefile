project=name

build:
 if [ -d dist/ ]; then rm -r dist/; fi
 mkdir dist/

 find src/ -type f -exec chmod 0644 {} \;
 find src/ -type d -exec chmod 0755 {} \;

 find src/usr/share/${project}/ -type f -exec chmod +x {} \;

 chmod +x src/DEBIAN/preinst src/DEBIAN/postinst src/DEBIAN/prerm src/DEBIAN/postrm

 fakeroot dpkg -b src/ dist/${project}.deb
 lintian -i dist/${project}.deb
