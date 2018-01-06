#!/bin/bash

############################################################################
#
#  lowerdir: Any filesystem, does not need to be on a writable filesystem.
#  upperdir: The upperdir is normally on a writable filesystem.
#  workdir:  The workdir needs to be an empty directory on the same filesystem as upperdir.
#  merged:   combined dir.
#  
#  init layer: docker initial layer, put /etc/resolv.conf, hostname etc here, each init layer comes with a top layer.
#  white out: write out file, as deleted file flag, for example, we deleted /bin/tar, then list the upper dir, we can see:
#  c---------  1 root root 0, 0 1月   6 14:47 tar
#
#  ./diff: upperdir, it is writable.
#  ./merged: combined dir, show the whole view.
#  ./work: workdir, needs to be empty and along with upperdir, usually used for automical operation between lower and upper.
#  ./link: indicates the top writable layer id which stored in .../overlay2/l/XXX
#  ./lower serial lowerdir id, means read-only fs.
#  
#  BTW, .../containers/<container_id>/xxx is all files needed by container, it's all about container's metadata.
#
#  so u can try:
#  LOWER_DIR=/var/lib/docker/overlay2/l/24D7QNUVUDGWBYUSZ7VO6VLVHO:/var/lib/docker/overlay2/l/UZG4T3XQHTJ6QOG2BVCBC4RRYE:/var/lib/docker/overlay2/l/4K7WBWUXSFAUPHHGTWSLN2KHPM:/var/lib/docker/overlay2/l/73RX5T634IPUZY3Y63A4VXL3XP
#  UPPER_DIR=/var/lib/docker/overlay2/e347deea9ef0e31a3addb01934335e3b8d0ac4a6b48fac99cab070d2550c1c7d/diff
#  WORK_DIR=/var/lib/docker/overlay2/e347deea9ef0e31a3addb01934335e3b8d0ac4a6b48fac99cab070d2550c1c7d/work
#  MERGED_DIR=/var/lib/docker/overlay2/e347deea9ef0e31a3addb01934335e3b8d0ac4a6b48fac99cab070d2550c1c7d/merged
#
#  mount -t overlay overlay \
#        -o rw,realtime,lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR $MERGED_DIR
#
#  Q: who placed links under `/var/lib/docker/overlay2/l`?
#
#  Author: Colstuwjx@gmail.com
#
############################################################################

echo "Enjoy overlay and union fs!"
