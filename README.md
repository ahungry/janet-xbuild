# Janet xbuild

An attempt to make cross-compiled and cross-platform Janet builds
using the module system as an alternative approach to the pre-built
binary of https://github.com/ahungry/puny-gui

# Important notes

The jpm build command will not succeed unless it is explicitly linked
to a proper janet dll.  The dll MUST be linked into the janet entry
point as well (vs inline janet.c) or else it will be an unhandled
memory read and result in a segfault (a similar process probably
happens behind the scenes for the GNU/Linux builds).

# License

Copyright 2020 Matthew Carter <m@ahungry.com> GPLv3 or later
