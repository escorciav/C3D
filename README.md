This branch simplifies installation of C3D. The purpose is to reduce the dependencies to just three :wink:

By using this, I would appreciate if you help me:

- Giving a start in my github C3D-fork. I keep track of how valuable is this in that way.

- Citing my [research](https://github.com/escorciav/daps). I used C3D there :stuck_out_tongue_winking_eye:.

## Installation

1. Install requirements: gcc, cuda-7.5, conda

  Make sure that all of them are visible.

1. For C3D-v1.0, create a Makefile.config similar to [this](C3D-v1.0/Makefile.config.example).

  `cp C3D-v1.0/Makefile.config.example C3D-v1.0/Makefile.config`

  > Do not forget to edit the file appropriately

1. Make a copy of the environment for compilation.

  `cp activate-compile.sh.example activate-compile.sh`

1. Build. By default, it will build both versions.

  `bash install.sh`

  > Note: Ignore any error in C3D-v1.0 if you just care about v1.1 and vice versa.
  
  > Warning: I try use NCCL in version 1.1. Turn it off if you do not need it

1. Finally, update your LD_LIBRARY_PATH, PATH, and PYTHONPATH before any attempt to use it.

  Let's say you wanna use version 1.1. This can be done:

  - `export PATH=[path-to-c3d-root]/C3D-v1.1/build/bin:$PATH`

  - `export LD_LIBRARY_PATH=[path-to-c3d-root]/C3D-v1.1/build/lib:$LD_LIBRARY_PATH`

  - `export PYTHONPATH=[path-to-c3d-root]/C3D-v1.1/build/python:$PYTHONPATH`

- Optional:

  I heavily use [modules-environment](http://modules.sourceforge.net/). I like my shell clean, functional and as modular as possible. There are some perks for users like me.

  - [bash script](activate-compile.sh.example) to setup environment before building C3D. Put your modules there in the variable `modules` when after copy the file.

  - [modules script](c3d-v1.1.modules) make C3D visible for the user. modules-environment recipe used to set the environment.

  > Disclaimer: I create modules-recipes as old writter wrote book. Edit them! :laughing:

## ToDo

- Test with anaconda:cudatoolkit, anaconda:gcc

- Push binaries in anaconda.org