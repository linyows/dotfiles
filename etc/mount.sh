#!/bin/sh

# $ vim ~/.bashrc
# alias allmount='sh ~/.user_config/imac27/shell/mount.sh'
# alias singlemount='sh ~/.user_config/imac27/shell/mount.sh'
# alias usen='cd /Volumes/usen/trunk'
# alias loapi='cd /Volumes/loapi/web/trunk'
# alias w4='cd /Volumes/w4/web/trunk'
# alias kokan='cd  /Volumes/kokan/trunk'
# alias conpane='cd  /Volumes/conpane/web/trunk'
# alias loftp='cd /Volumes/lotools/web/zendftp.lolipop.local/trunk'
# alias loftpold='cd /Volumes/lotools/web/lolipopftp.lolipop.local/trunk'
# alias lomailer='cd /Volumes/lomailer/mail'
# alias woopa='cd /Volumes/loother/woopa'
# alias perori='cd /Volumes/perori/web'

HOST=$1

case $HOST in
    'usen')
        mkdir /Volumes/usen
        mount_smbfs "//GUEST:@192.168.0.156/user.lolipop.local" /Volumes/usen
        ;;
    'kokan')
        mkdir /Volumes/kokan
        mount_smbfs "//GUEST:@192.168.0.150/umsys.paperboy.co.local" /Volumes/kokan
        ;;
    'w4')
        mkdir /Volumes/w4
        mount_smbfs "//GUEST:@192.168.0.99/Public" /Volumes/w4
        ;;
    'lomailer')
        mkdir /Volumes/lomailer
        mount_smbfs "//GUEST:@192.168.0.182/tools.lolipo" /Volumes/lomailer
        ;;
    'lotools')
        mkdir /Volumes/lotools
        mount_smbfs "//GUEST:@192.168.0.183/Public" /Volumes/lotools
        ;;
    'loapi')
        mkdir /Volumes/loapi
        mount_smbfs "//GUEST:@192.168.0.168/lolipop" /Volumes/loapi
        ;;
    #'api-trunk')
    #    /sbin/mount -t smbfs //GUEST:@192.168.0.168/lolipop /Volumes/api.lolipop.local//
    #    /bin/mount -o guest -t cifs //192.168.0.168/trunk /home/hara/mount/api/trunk/
    #    ;;
    'ml')
        mkdir /Volumes/ml01.lolipop.local
        /sbin/mount -t smbfs //GUEST:@192.168.0.184/lolipop /Volumes/ml01.lolipop.local/
        ;;
    'mm')
        mkdir /Volumes/mm01.lolipop.local
        /sbin/mount -t smbfs //GUEST:@192.168.0.185/lolipop /Volumes/mm01.lolipop.local/
        ;;
    'madame')
        mkdir /Volumes/madame
        mount_smbfs "//GUEST:@192.168.73.153/webp" /Volumes/madame
        ;;
    'madame-bin')
        mkdir /Volumes/sv.madame.local-bin
        /sbin/mount -t smbfs //GUEST:@192.168.73.153/bin /Volumes/sv.madame.local-bin/
        ;;
    'conpane')
        mkdir /Volumes/conpane
        mount_smbfs "//GUEST:@192.168.73.232/user.chicappa.local" /Volumes/conpane
        ;;
    'chikan')
        mkdir /Volumes/chikan
        mount_smbfs "//GUEST:@192.168.73.236/umsys.fixpod" /Volumes/chikan
        ;;
    'chicappa')
        mkdir /Volumes/chicappa
        mount_smbfs "//GUEST:@192.168.73.253/bin" /Volumes/chicappa
        ;;
    '120batch')
        mkdir /Volumes/120batch
        /sbin/mount -t smbfs //GUEST:@192.168.0.120/batch /Volumes/120batch/
        ;;
    '200')
        mkdir /Volumes/200
        mount_smbfs "//oda:oda@192.168.0.200/200server" /Volumes/200
        ;;
    'hetemladmin')
        mkdir /Volumes/hetemladmin
        mount_smbfs "//tomohisa:badmeter95@admin.heteml.local/www" /Volumes/hetemladmin
        ;;
    'honic')
        mkdir /Volumes/honic-linyows
        mount_smbfs "//linyows:linyows@dev001.honic.pb/linyows" /Volumes/honic-linyows
        ;;
    *)
        mkdir /Volumes/conpane
        mount_smbfs "//GUEST:@192.168.73.232/user.chicappa.local" /Volumes/conpane
        mkdir /Volumes/usen
        mount_smbfs "//GUEST:@192.168.0.156/user.lolipop.local" /Volumes/usen
        mkdir /Volumes/w4
        mount_smbfs "//GUEST:@192.168.0.99/Public" /Volumes/w4
        mkdir /Volumes/kokan
        mount_smbfs "//GUEST:@192.168.0.150/umsys.paperboy.co.local" /Volumes/kokan
        mkdir /Volumes/loapi
        mount_smbfs "//GUEST:@192.168.0.168/lolipop" /Volumes/loapi
        mkdir /Volumes/lotools
        mount_smbfs "//GUEST:@192.168.0.183/Public" /Volumes/lotools
        mkdir /Volumes/lomailer
        mount_smbfs "//GUEST:@192.168.0.182/tools.lolipo" /Volumes/lomailer
        mkdir /Volumes/perori
        mount_smbfs "//GUEST:@192.168.0.174/perori" /Volumes/perori
        mkdir /Volumes/loother
        mount_smbfs "//GUEST:@192.168.0.188/lolipop" /Volumes/loother
        mkdir /Volumes/hetemladmin
        mount_smbfs "//tomohisa:badmeter95@admin.heteml.local/www" /Volumes/hetemladmin
        ;;
esac
