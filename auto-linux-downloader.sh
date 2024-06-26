#/bin/bash

#
# Author: Peter Paskowsky
#
# Updated by: AlexW-578
#
# This script automatically downloads .torrent files for Linux distributions
# Paired with a torrent client this creates an automated Linux iso seed box.
# I just chose to download the most common torrents for each distro, but 
# this script could be edited to download just the torrents you would like.
#
# To add this as a cronjob, run crontab -e and add something like the line below
# 
# 0 3 * * * /root/auto-linux-downloader.sh
#

#torrent client's watch directory
torrent_location=./watch/


#Delete old torrents betfore starting
#rm $torrent_location/*


################# FTP ##################

#Ubuntu 
ubuntu=ftp://releases.ubuntu.com/releases/
release=`curl -l $ubuntu | sort -n -r | awk NR==1`
wget -r --no-directories --no-parent -A "*.torrent" $ubuntu/$release/ -P $torrent_location/


#Debian DVD amd64 
debian=ftp://cdimage.debian.org/cdimage/release/current/amd64/bt-dvd/
wget -r --no-directories --no-parent -A "*.torrent" -R "*update*,*edu*,*mac*" $debian/ -P $torrent_location/


#Debian CD amd64 
debian=ftp://cdimage.debian.org/cdimage/release/current/amd64/bt-cd/
wget -r --no-directories --no-parent -A "*netinst*" -R "*update*,*edu*,*mac*" $debian/ -P $torrent_location/


#Debian DVD i386
debian=ftp://cdimage.debian.org/cdimage/release/current/i386/bt-dvd/
wget -r --no-directories --no-parent -A "*.torrent" -R "*update*,*edu*,*mac*" $debian/ -P $torrent_location/


#Debian CD i386
debian=ftp://cdimage.debian.org/cdimage/release/current/i386/bt-cd/
wget -r --no-directories --no-parent -A "*netinst*" -R "*update*,*edu*,*mac*" $debian/ -P $torrent_location/


################# HTTP ##################


#Raspian
wget http://downloads.raspberrypi.org/raspbian_latest.torrent -O $torrent_location/raspbian_latest.torrent


#Fedora 
wget -r --no-directories --no-parent -A "Fedora-Workstation*.torrent" -R "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-Server*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/

#Fedora Spins
wget -r --no-directories --no-parent -A "Fedora-KDE-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-Budgie-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-LXDE-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-LXQt-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-MATE-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-SoaS-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-Sway-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-Xfce-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-i3-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/

#Fedora Atomics
wget -r --no-directories --no-parent -A "Fedora-Kinoite-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/
wget -r --no-directories --no-parent -A "Fedora-Silverblue-*.torrent" -R  "*Alpha*,*Beta*" http://torrent.fedoraproject.org -P $torrent_location/


#Kali
wget -r --no-directories --no-parent -A "*-live-*.torrent" https://cdimage.kali.org/current/ -P $torrent_location/


#Slackware 
wget -r --no-directories --no-parent -A "*dvd*.torrent" -R "*source*" http://www.slackware.com/torrents/ -P $torrent_location/

#Arch
wget -r --no-directories --no-parent -A "*.torrent" https://geo.mirror.pkgbuild.com/iso/latest/ -P $torrent_location/

#Tails
wget -r --no-directories --no-parent -A "*.torrent" https://tails.net/torrents/files/ -P $torrent_location/


#cleanup
#rm $torrent_location/robots.txt
#rmdir $torrent_location/*

#Remove Unwanted Arch's
#rm $torrent_location/*i386*
#rm $torrent_location/*amd64*
#rm $torrent_location/*x86_64*
#rm $torrent_location/*arm*
#rm $torrent_location/*ppc64le*
#rm $torrent_location/*aarch64*
#rm $torrent_location/*s390x*