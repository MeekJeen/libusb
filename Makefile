TOOL_PATH=~/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu/bin

CC      := $(TOOL_PATH)/aarch64-linux-gnu-g++
TARGET  := test
SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))

LIBS    := -lusb-1.0 pthread
LDFLAGS := -L ./
INCLUDE := -I.
CFLAGS  :=  $(INCLUDE) -fPIC #-O3 -std=c++11 -g -Wall

.PHONY : objs clean
all : $(TARGET)
#$@:目标文件 $^:所有依赖文件(*.c *.cpp)
#第一种方式
objs : $(OBJS)
    %.o :%.cpp #.o依赖.cpp
	$(CC) -c $^ $(CFLAGS) -o $@
    %.o : %.c #.o依赖.c
	$(CC) -c $^ $(CFLAGS) -o $@

#TAEGET依赖OBJS
$(TARGET) : $(OBJS)
	    $(CC) $(OBJS) -o $@ $(CFLAGS) $(LDFLAGS) $(LIBS)
#第二种方式
# $(TARGET) :
# 	$(CC) -o $@ $(SOURCE) $(CFLAGS) $(LDFLAGS) $(LIBS)

clean :
	rm -f *.o $(TARGET)
