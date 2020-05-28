WINCC=x86_64-w64-mingw32-gcc

#CFLAGS=-Wall -std=c99 -fsanitize=address -g -fPIC -D_WIN32_WINNT=0x0600
CFLAGS=-Wall -std=c99 -fPIC -static -D_WIN32_WINNT=0x0600
LFLAGS=-lm -pthread -lwinmm -lmswsock -ladvapi32 \
	-lmingw32 -lopengl32 -lpangowin32-1.0 -lgdi32 -lws2_32 -luuid -lcomctl32 -lole32  \
	-lcomdlg32

all: libjanet.dll janet.exe build/xbuild.dll

janet.exe: libjanet.dll build/xbuild.dll
	$(WINCC) $(CFLAGS) -I./ shell.c -o janet.exe $(LFLAGS) -L./ -l:libjanet_dll.a

libjanet.dll: libwinpthread-1.dll libgcc_s_seh-1.dll
	$(WINCC) $(CFLAGS) -shared -I./ janet.c -o libjanet.dll $(LFLAGS) -Wl,--out-implib,libjanet_dll.a

libwinpthread-1.dll:
	cp /usr/x86_64-w64-mingw32/bin/$@ ./

libgcc_s_seh-1.dll:
	cp /usr/x86_64-w64-mingw32/bin/$@ ./

build/xbuild.dll: cleanso
	CC=$(WINCC) jpm --build-target=mingw build
	cp build/xbuild.so build/xbuild.dll

cleanso:
	-rm -fr build/*.so
	-rm -fr build/*.o

clean:
	-rm -fr build/*
	-rm -f libjanet.dll
	-rm -f janet.exe

.PHONY: cleanso
