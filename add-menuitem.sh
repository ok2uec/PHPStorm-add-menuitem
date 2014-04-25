#!/bin/bash
#
# Resolve the location of the PHPStorm. 
  
PRG=$0
while [ -h "$PRG" ]; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '^.*-> \(.*\)$' 2>/dev/null`
    if expr "$link" : '^/' 2> /dev/null >/dev/null; then
        PRG="$link"
    else
        PRG="`dirname "$PRG"`/$link"
    fi
done

PHPSTORM_BIN=`dirname "$PRG"` 
APPLICATIONS_FILE="/usr/share/applications/phpstorm7.desktop"
  
cat << EOF > $APPLICATIONS_FILE
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=PHPStorm 7
Keywords=Application;Development;Java;IDE
GenericName=Developer PHP Tolls
Comment=Development PHP!
Type=Application
Categories=Development;RevisionControl;Application;PHP
Terminal=false
StartupNotify=true
Exec=$PHPSTORM_BIN/phpstorm.sh %f
Icon=$PHPSTORM_BIN/webide.png
EOF
 
 
