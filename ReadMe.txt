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

三、编译libusb测试demo
# aarch64-linux-gnu-g++ libusb.cpp -L. -l usb-1.0 -o test
# export LD_LIBRARY_PATH=/userdata
# ./tes

//查看usb端点信息:VID:2207 PID:0006
# lsusb -v -d 4537:0031
# lsusb -v -d 4537:0031 | grep bEndpointAddress
# g++ libusb.cpp -lusb-1.0

四、格式化分区，挂载ext4文件系统到/data/test目录
//格式化分区
# make_ext4fs /dev/block/sd5

mount命令的标准形式如下：
mount   -t  type   device   dir
//sync同步挂载文件系统
# mount -t ext4 -o sync,rw /dev/block/sd5 /sdcard/test

