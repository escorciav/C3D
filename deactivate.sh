# ----------------------------------------------------------------------------
# (Abbusive) cleaning of your shell
#
# Usage: $ . activate.sh
#
# Developer: Victor Escorcia
# License: WTFPL
# ----------------------------------------------------------------------------
if hash conda 2> /dev/null; then
  source deactivate
fi

if hash module 2> /dev/null; then
  module purge
fi

export LD_LIBRARY_PATH=""
