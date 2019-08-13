# Linux Befehle (Sammelsorium)

## tarball anhand einer Liste erstellen
tar cvzf update.190423.tar.gz $(git diff --name-only 1a5d 70a9)

## find mit chmod kombinieren
find . -type d -exec chmod 750 {} \;

## Partition erweitern
lvextend --resizefs -l +100%FREE /dev/mapper/fedora-root

## RHEL

### Update mit Paket-Exclude (bspw. kernel)
yum -y --exclude=kernel\* update
