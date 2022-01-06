#!/bin/bash

# mirror_test.sh
# Originally written for Ubuntu by Lance Rushing <lance_rushing@hotmail.com>
# Dated 9/1/2006
# Taken from http://ubuntuforums.org/showthread.php?t=251398
# This script is covered under the GNU Public License: http://www.gnu.org/licenses/gpl.txt

# Modified for Slackware by Jeremy Brent Hansen <jebrhansen -at- gmail.com>
# Modified 2015/11/06

# Modified 2016/05/13 by Jose Bovet Derpich jose.bovet@gmail.com

#----------------------------------------------------------------
# Slackware64-current
#----------------------------------------------------------------
# Add or change mirrors from /etc/slackpkg/mirrors as desired (these are the US mirrors)
MIRRORS="ftp://carroll.aset.psu.edu/pub/linux/distributions/slackware/slackware64-current/
http://carroll.aset.psu.edu/pub/linux/distributions/slackware/slackware64-current/
ftp://ftp.gtlib.gatech.edu/nv/ao2/lxmirror/ftp.slackware.com/slackware64-current/
ftp://ftp.osuosl.org/.2/slackware/slackware64-current/
http://ftp.osuosl.org/.2/slackware/slackware64-current/
ftp://hpc-mirror.usc.edu/pub/linux/distributions/slackware/slackware64-current/
http://hpc-mirror.usc.edu/pub/linux/distributions/slackware/slackware64-current/
ftp://marmot.tn.utexas.edu/pub/slackware/slackware64-current/
http://marmot.tn.utexas.edu/slackware/slackware64-current/
ftp://mirror.cs.princeton.edu/pub/mirrors/slackware/slackware64-current/
http://mirror.metrocast.net/slackware/slackware64-current/
ftp://mirrors.easynews.com/linux/slackware/slackware64-current/
http://mirrors.easynews.com/linux/slackware/slackware64-current/
http://mirrors.kingrst.com/slackware/slackware64-current/
ftp://mirrors.us.kernel.org/slackware/slackware64-current/
http://mirrors.us.kernel.org/slackware/slackware64-current/
ftp://mirrors.xmission.com/slackware/slackware64-current/
http://mirrors.xmission.com/slackware/slackware64-current/
http://slackbuilds.org/mirror/slackware/slackware64-current/
http://slackware.cs.utah.edu/pub/slackware/slackware64-current/
http://slackware.mirrorcatalogs.com/slackware64-current/
http://slackware.mirrors.pair.com/slackware64-current/
ftp://slackware.mirrors.tds.net/pub/slackware/slackware64-current/
http://slackware.mirrors.tds.net/pub/slackware/slackware64-current/
ftp://slackware.virginmedia.com/mirrors/ftp.slackware.com/slackware64-current/
http://slackware.virginmedia.com/slackware64-current/
ftp://spout.ussg.indiana.edu/linux/slackware/slackware64-current/
http://spout.ussg.indiana.edu/linux/slackware/slackware64-current/
ftp://teewurst.cc.columbia.edu/pub/linux/slackware/slackware64-current/
http://teewurst.cc.columbia.edu/pub/linux/slackware/slackware64-current/"

# Use any adequetly sized file to test the speed. This is ~7MB.
# The location should be based on the relative location within
# the slackware64-current tree. I originally tried a smaller 
# file (FILELIST.TXT ~1MB), but I was seeing slower speed results
# since it didn't have time to fully max my connection. Depending
# on your internet speed, you may want to try different sized files.
FILE="kernels/huge.s/bzImage"

# Number of seconds before the test is considered a failure
TIMEOUT="5"

# String to store results in
RESULTS=""

# Set color variables to make results and echo statements cleaner
RED="\e[31m"
GREEN="\e[32m"
NC="\e[0m"  #No color

for MIRROR in $MIRRORS ; do
    
    echo -n "Testing ${MIRROR} "    
    URL="${MIRROR}${FILE}"
    SPEED=$(curl --max-time $TIMEOUT --silent --output /dev/null --write-out %{speed_download} $URL)

    if (( $(echo "$SPEED < 10000.000" | bc -l) )) ; then
        echo -e "${RED}Fail${NC}";
    else 
        SPEED="$(numfmt --to=iec-i --suffix=B --padding=7 $SPEED)ps"
        echo -e "${GREEN}$SPEED${NC}"
        RESULTS="${RESULTS}\t${SPEED}\t${MIRROR}\n";
    fi

done;
echo -e "\nResults:"
echo -e $RESULTS | sort -hr  
