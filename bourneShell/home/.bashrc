#========================================================== .user.setup.start
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
cd
#```
p=echo
#ans=~/ascii/STY-HLK.ANS
ans=$1
# POSIX
meta_size=$(wc -c < "$ans")
$p "
meta::size: $meta_size
"
size=71
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
#---------------------------------------------------------- .user.colorscheme
#```
PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\H\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
export PS1
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
#```

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
ans=$1
size=71
enc="iconv -f CP437 -t UTF-8"
box="boxes -d java-cmt -p a2v1"
reader=bsdcat
##```
$p "
'show::ascii:art:list'
"
#```
#ll ~/ | grep -e ans -e ANS
#```
#ans=~/ascii/STY-HLK.ANS
ans=$1
# POSIX
meta_size=$(wc -c < "$ans")
$p "
meta::size: $meta_size
#============================================================== .user.setup.end
"
