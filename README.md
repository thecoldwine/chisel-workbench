# chisel-workbench

This repo is my workbench for chiseling images.

Rationale: chiseling is intimidating process and it is tricky to get through
whole process of chiseling-linting-reviewing. I decided to automate (a bit)
my package inspection process with very basic scripts.

Assuming your chisel-releases repo is in $HOME/Development directory scripts will provide you with
- build.sh for building
- chroot.sh (requires root) for chrooting into filesystem (don't forget bash and coreutils slices)
- analyze-package.sh and analyse-package-docker.sh to inspect the package contents.

In general I slice complex packages in the following order:

1. Use debtree + graphviz to print a nice image of dependencies so I can print it and cross out whatever
I already sliced.
2. Starting from leaf unsliced packages use analyze-package-docker.sh for the target package and create slices.
3. At some point use chroot + ldd to make sure there are no missing dynamic objects in the linking process.
