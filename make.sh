printf "\x1bc\x1b[43;37m give me a .c file to compile ? "
read ai
nasm -o /tmp/boot.bin boot.asm
tcc  -Wl,-Ttext,0x010000 -Wl,--oformat,binary -static "$ai" -o /tmp/hellos.com -nostdlib
dd if=/tmp/hellos.com of=/tmp/boot.bin seek=1 conv=notrunc
cp -f /tmp/boot.bin ./
/usr/bin/qemu-system-x86_64 -boot a -fda boot.bin
