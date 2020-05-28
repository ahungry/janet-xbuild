(declare-project
  :name "xbuild"
  :description "Test cross building for ming"
  :author "Matthew Carter"
  :license "GPLv3"
  :url "https://github.com/ahungry/xbuild/"
  :repo "git+https://github.com/ahungry/xbuild.git")

(declare-native
 :name "xbuild"
 #:embedded @["bench_lib.janet"]
 :cflags ["-I./" "-std=c99" "-Wall" "-Wextra"
          #"-fsanitize=address" "-g"
          "-fPIC" "-shared" "-static" "-D_WIN32_WINNT=0x0600"]
 :lflags ["-Wl,--out-implib,libxbuild_dll.a" "-lm" "-pthread" "-lwinmm"
          "-lws2_32"
          "-lmswsock"
          "-ladvapi32"
          "-L./"
          "-l:libjanet_dll.a"
          #"-l:libjanet"
          ]
 :source @["xbuild.c"])
