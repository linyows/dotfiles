#!/bin/sh

## --------------------------------------
##  Samba  Auto  Mount  Shell for mac
##
##  Author   :  T.Hara
## --------------------------------------
MODE=$1
HOST=$2

case $MODE in 
    'start')
        case $HOST in 
            'all')
                ;;
            'usen')
                mkdir /Volumes/user.lolipop.local
                /sbin/mount -t smbfs //GUEST:@192.168.0.156/user.lolipop.local /Volumes/user.lolipop.local/
                ;;
            'kokan')
                mkdir /Volumes/umsys.paperboy.co.local
                /sbin/mount -t smbfs //GUEST:@192.168.0.150/umsys.paperboy.co.local /Volumes/umsys.paperboy.co.local/
                ;;
            'www')
                mkdir /Volumes/www.lolipop.local
                /sbin/mount -t smbfs //GUEST:@192.168.0.99/Public /Volumes/www.lolipop.local/
                ;;
            'tools')
                mkdir /Volumes/tools.lolipop.local
                /sbin/mount -t smbfs //GUEST:@192.168.0.182/tools.lolipop.local /Volumes/tools.lolipop.local/
                ;;
            'api')
                mkdir /Volumes/api.lolipop.local
                /sbin/mount -t smbfs //GUEST:@192.168.0.168/trunk /Volumes/api.lolipop.local/
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
                mkdir /Volumes/sv.madame.local
                /sbin/mount -t smbfs //GUEST:@192.168.73.153/webp /Volumes/sv.madame.local/
                ;;
            'madame-bin')
                mkdir /Volumes/sv.madame.local-bin
                /sbin/mount -t smbfs //GUEST:@192.168.73.153/bin /Volumes/sv.madame.local-bin/
                ;;
            'c-conpane')
                mkdir /Volumes/user.chicappa.local
                /sbin/mount -t smbfs //GUEST:@192.168.73.232/user.chicappa.local /Volumes/user.chicappa.local/
                ;;
            'c-chikan')
                mkdir /Volumes/umsys.chicappa.local
                /sbin/mount -t smbfs //GUEST:@192.168.73.236/umsys.fixpod /Volumes/umsys.chicappa.local/
                ;;
            'c-www')
                mkdir /Volumes/www.chicappa.local
                /sbin/mount -t smbfs //GUEST:@192.168.73.253/bin /Volumes/www.chicappa.local/
                ;;
            '120batch')
                mkdir /Volumes/120batch
                /sbin/mount -t smbfs //GUEST:@192.168.0.120/batch /Volumes/120batch/
                ;;
        esac
        ;;
    'stop')
        case $HOST in 
            'usen')
                /sbin/umount  /Volumes/user.lolipop.local
                ;;
            'kokan')
                /sbin/umount  /Volumes/umsys.paperboy.co.local
                ;;
            'www')
                /sbin/umount  /Volumes/www.lolipop.local
                ;;
            'tools')
                /sbin/umount  /Volumes/tools.lolipop.local
                ;;
            'api')
                /sbin/umount  /Volumes/api.lolipop.local
                ;;
            'ml')
                /sbin/umount  /Volumes/ml01.lolipop.local
                ;;
            'mm')
                /sbin/umount  /Volumes/mm01.lolipop.local
                ;;
            'madame')
                /sbin/umount  /Volumes/sv.madame.local
                ;;
            'madame-bin')
                /sbin/umount  /Volumes/sv.madame.local-bin
                ;;
            'c-conpane')
                /sbin/umount  /Volumes/user.chicappa.local
                ;;
            'c-chikan')
                /sbin/umount  /Volumes/umsys.chicappa.local
                ;;
            'c-www')
                /sbin/umount  /Volumes/www.chicappa.local
                ;;
            '120batch')
                /sbin/umount  /Volumes/120batch
                ;;
        esac
        ;;
esac
