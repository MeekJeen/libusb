一、编译使用libusb.so
0.下载libusb源码
https://github.com/libusb/libusb/releases

1.安装libudev-dev
# sudo apt-get install libudev-dev libusb-1.0-0-dev

2.设置交叉编译器环境变量
# emacs /etc/profile添加
export PATH=$PATH:~/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu/bin
# source /etc/profile

3.配置编译
# ./configure --build=x86_64 --host=aarch64-linux-gnu --prefix=~/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu/bin CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ --disable-udev
# make

手动Debug
# aarch64-linux-gnu-g++ libusb.cpp -L. -l usb-1.0 -o test
# export LD_LIBRARY_PATH=/userdata
# adb push test /data
# adb shell
# ./test

二.编译lsusb可执行程序
1.下载usbutils源码
https://mirrors.edge.kernel.org/pub/linux/utils/usb/usbutils/
