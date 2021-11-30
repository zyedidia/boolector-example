PROG = bv
all: $(PROG)

ALLPROGRAMS = $(PROG)

PTHREAD=1
include rules.mk

INCDIR = deps/include
INC = $(INCDIR)
INC_PARAMS=$(foreach d, $(INC), -I$d)
LIB = deps/lib
LIB_PARAMS = $(foreach d, $(LIB), -L$d)
CFLAGS += $(INC_PARAMS)
LDFLAGS += $(LIB_PARAMS)
LDLIBS += -lboolector -llgl -lbtor2parser -lm

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

%.o: %.c $(BUILDSTAMP)
	$(CC) $(CFLAGS) $(O) $(DEPCFLAGS) -o $@ -c $<

$(PROG): $(PROG).o
	$(CC) $(CFLAGS) $(LDFLAGS) $(O) -o $@ $^ $(LDLIBS)

# for inspecting assembly
%.s: %.c $(BUILDSTAMP)
	$(CC) $(CFLAGS) $(O) $(DEPCFLAGS) -o $@ -S $<

clean:
	rm -rf $(ALLPROGRAMS) *.o $(DEPSDIR)

format:
	clang-format -i $(SRC) $(wildcard $(INCDIR)/*.h)

.PHONY: all clean format

