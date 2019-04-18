CC=g++

# compile for unix by default
ifndef MACOS
	MACOS=no
endif

# compile with cv non-free modules by default
ifndef BUILD_WITH_OPENCV_NONFREE
    BUILD_WITH_OPENCV_NONFREE=yes
endif

SOURCES=$(TARGET).cpp 

OBJECTS=$(SOURCES:.cpp=.o)

EXECUTABLE=$(TARGET)

#CFLAGS := -Wall -g -O3 -Wfatal-errors -mssse3 -msse2 -march=native
CFLAGS := -ggdb 
LDFLAGS :=  grief/grief.cpp -Llib -Wl,

# handle unix/apple builds
ifeq ($(MACOS), no)
	LDFLAGS := ${LDFLAGS}-rpath='$$ORIGIN/lib'
endif
LDFLAGS := ${LDFLAGS} -g `pkg-config opencv --libs`

# OpenCV
#CFLAGS += `pkg-config opencv --cflags`
# non-free module support
ifeq ($(BUILD_WITH_OPENCV_NONFREE), yes)
    CFLAGS := ${CFLAGS}-DBUILD_WITH_OPENCV_NONFREE
endif

all: match_all evolve_grief annotate

match_all: match_all.cpp grief/grief.cpp 
	$(CC) match_all.cpp $(CFLAGS) $(LDFLAGS) -o $@ 

evolve_grief: evolve_grief.cpp grief/grief.cpp 
	$(CC) evolve_grief.cpp $(CFLAGS) $(LDFLAGS) -o $@
 
annotate: annotate.cpp grief/grief.cpp 
	$(CC) annotate.cpp $(CFLAGS) $(LDFLAGS) -o $@ 

clean:
	rm -f $(OBJECTS) $(EXECUTABLE) 
	rm -f match_all evolve_grief annotate 

cleanall:
	rm -f *.o 
