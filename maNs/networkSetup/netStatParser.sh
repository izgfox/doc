#!/usr/bin/env bash

# root privileges on mount
# Variables

ip=22.178.242.102
port=8086
db=test


# Measurement

metric=netstat_total
# Prepare

ramfs='/mnt/ramfs'
mkdir -p $ramfs
mount -t ramfs -o size=2m ramfs $ramfs

generate_post_data()

{

datenano=`date +%s%N`

echo "$metric,state=$1,program=$2,localAddress=$3,foreignAddress=$4 localPort=$5,foreignPort=$6,recvQ=$7,sendQ=$8,user=$9,pid=${10},inode=${11} $datenano"

}


netstat -planet | grep -v 'TIME_WAIT' | sed '1,2d' |

while read -r line

do

proto=`echo "$line" | awk '{print $1}'`

state=`echo "$line" | awk '{print $6}'`

localAddressRaw=`echo "$line" | awk '{print $4}' | sed 's/:/ /g'`

foreignAddressRaw=`echo "$line" | awk '{print $5}' | sed 's/:/ /g'`


if [[ $state == "LISTEN" ]]; then

localPort=`echo "$localAddressRaw" | awk '{print $2}'`

foreignAddress="-1"

foreignPort="-1"

else

    localPort=`echo "$localAddressRaw" | awk '{print $2}'`

    foreignAddress=`echo "$foreignAddressRaw" | awk '{print $1}'`

    foreignPort=`echo "$foreignAddressRaw" | awk '{print $2}'`

fi

localAddress=`echo "$localAddressRaw" | awk '{print $1}'`

if [[ $proto == "tcp6" ]]; then

localPort=$localAddress
localAddress="0.0.0.0"

fi

#    echo "localAddress=$localAddress"
#    echo "localPort=$localPort"
#    echo "foreignAddress=$foreignAddress"
#    echo "foreignPort=$foreignPort"

recvQ=`echo "$line" | awk '{print $2}'`
sendQ=`echo "$line" | awk '{print $3}'`
#echo "recvQ=$recvQ"
#echo "sendQ=$sendQ"
user=`echo "$line" | awk '{print $7}'`
inode=`echo "$line" | awk '{print $8}'`
#echo "inode=$inode"
pidProgramRaw=`echo "$line" | awk '{print $9}' | sed 's3/3 3g'`
pid=`echo $pidProgramRaw | awk '{print $1}'`

if [[ $pid == "-" ]]; then

pid="-1"
fi

program=`echo $pidProgramRaw | awk '{print $2}'`


#    echo "pid=$pid"

#    echo "program=$program"

#json=`curl -x "" -is \

#-XPOST  "http://$ip:$port/write?db=$db" --data-binary "$(generate_post_data \

# "$state" \

# "$program" \

# "$localAddress" \

# "$foreignAddress" \

# "$localPort" \

# "$foreignPort" \

# "$recvQ" \

# "$sendQ" \

# "$user" \

# "$pid" \

# "$inode" \

#)"`

#message=`echo $json`

#echo $message

generate_post_data "$state" "$program" "$localAddress" "$foreignAddress" "$localPort" "$foreignPort" "$recvQ" "$sendQ" "$user" "$pid" "$inode" >> $ramfs/send

done

#message=`echo $json`

#echo $message
cat $ramfs/send
rm $ramfs/send

umount $ramfs
