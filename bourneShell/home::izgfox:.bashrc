#========================================================== .user.setup.start
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
cd
#```
p=echo
#ans=~/ascii/STY-HLK.ANS
i=`ls  | grep -e ans -e ANS | grep -v png | shuf -n 1`
ans=$i
# POSIX
meta_size=$(wc -c < "$ans")
##```
#----------------------------------------------------------------------------
#------------------------------------------------------------- ascii.wellcome
$p "
'file::meta::size:'
--------------------
 "$i :: $meta_size"  
--------------------
"
size=73
enc="iconv -f CP437 -t UTF-8"
box="boxes -d java-cmt -p a2v1"
reader=bsdcat
##```
##ans=~/ascii/ans/US-HAZ2.ANS
##size=50
##enc="iconv -f CP437 -t UTF-8"
##box="boxes -d java-cmt -p a2v1
##```
#----------------------------------------------------------------------------
#------------------------------------------------------------- ascii.wellcome
#```
$reader $ans | $enc | $box | head -n $size
#```
#----------------------------------------------------------------------------
#------------------------------------------------------------------------ .:)
#cat <<'EOF'
#           _..._
#         .'     '.
#        /  _   _  \
#        | (o)_(o) |
#         \(     ) /
#         //'._.'\ \
#        //   .   \ \
#       ||   .     \ \
#       |\   :     / |
#       \ `) '   (`  /_
#     _)``".____,.'"` (_
#     )     )'--'(     (
#      '---`      `---`
#EOF
####
#----------------------------------------------------------------------------
#-------------------------------------------------------- .user.login.summary
#```
printf "%s\n kernel: `uname -r`"
printf "%s\n user: `whoami`"
printf "%s\n home: `echo $HOME`\r\n"
#```
#
#----------------------------------------------------------------------------
#---------------------------------------------------- .export.LD_LIBRARY_PATH
#```
export LD_LIBRARY_PATH=/storage/kvm/usr/local/lib/
#```
#----------------------------------------------------- .command.aliases.short
#```
alias ll='ls -latr --color'
alias qwe='cd /storage/kvm/win10/stable/ && ./run'
alias qw='cd /storage/kvm/win10/stable/'
alias qmp='cd /storage/install/newest/qemu/scripts/ && qmp-shell /tmp/qmp.io'
alias n='nano ~/.bashrc'
#```
#----------------------------------------------------------------------------
#---------------------------------------------------------- .profile.commands
#*--- profile.reload ::
#```
alias profile.reload='source ~/.bashrc'
#```
#*    ->
##*------------- profile.reload ::
#```
  alias p.reload=profile.reload
#```
#*--- profile.save ::
#```
alias provile.save='rsync -avz ~/.bashrc /storage/backup/home/izgfox/.bashrc'
#```
#*    ->
##*---- p.save :: 
#```
  alias p.save=profile.save
#```
#-----------------------------------------------------------------------------
#*--- profile.list.aliases ::
#```
alias profile.list.aliases='grep -e alias ~/.bashrc'
#```
#*    ->
#*---   p.la ::
#```
alias   p.la='grep -e "::" -e "#" -e "alias" ~/.bashrc'
#```
#------------------------------------------------------------------------------
#------------------------------------------------------- .qt.kde.plasma.wayland
#*--- w.land ::
#```
alias w.land='startkwayland'
#```
#------------------------------------------------------------------------------
##----------------------------------------------------------- .admin.setup.wifi
##*
##*--- wifi.set.home.restart.check.
#```
alias wifi.set.home.restart.check='~.helper/.wifi/.home/wifi.set.restart.check'
#```
#*    ->
#*---   wi.setup ::
#```
alias   wi.setup=wifi.set.home.restart.check
#```
#------------------------------------------------------------------------------
##---------------------------------------------------------- :ascii::art::setup
#```
#ans=~/ascii/STY-HLK.ANS
ans=$i
size=71
enc="iconv -f CP437 -t UTF-8"
box="boxes -d java-cmt -p a2v1"
reader=bsdcat
##```
$p "
printf show::ascii:art:list
"
#```
#ll ~/ | grep -e ans -e ANS
#```
#ans=~/ascii/STY-HLK.ANS
ans=$i
# POSIX
meta_size=$(wc -c < "$ans")
# 'meta::size:'
#----------------------------------------------------------------------------
#---------------------------------------------------------- .user.colorscheme
#```
PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\H\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
export PS1
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=0>'
export LS_COLORS
#```
$p "
#------------------------------------------------------------------------------
-  ASCII-art : $i :: $meta_size
#-------------------------------------------------------- :file::metadata::size
-  STATUS :: $?
#============================================================== .user.setup.end
"
