#!/bin/bash

############################################################################
#
# hierarchy is a tree structure that maintains the cgroup subsystem and inherit.
# tasks indicates this hierarchy controlled Processes.
# 
# memory.limit_in_bytes just set the limitation with the tasks.
# freezer freeze processes or recover them.
# devices.list: a *:* rwm means (all) (major):(minor) read\write\mknod.
# devices.deny: echo xxx like the upper rule, such as echo a > /sys/fs/cgroup/xxx/devices.deny
# will remove the default entry, as we denied them.
# pids: limit the creation of process etc.
# net_cls\net_prio:
# the Network classifier cgroup provides an interface to
# tag network packets with a class identifier (classid).
#
# The Traffic Controller (tc) can be used to assign
# different priorities to packets from different cgroups.
# Also, Netfilter (iptables) can use this tag to perform
# actions on such packets.
#
# we can add new cgroup via:
#
# mount -t cgroup -o none,name=cgroup-test cgroup-test ./cgroup-test
# or
# mkdir /sys/fs/cgroup/<subsystem>/xxx
#
# CGroup V2 changes:
# 
# mount -t cgroup2 none $MOUNT_POINT
# cgroup.controllers
# cgroup.procs
# cgroup.subtree_control
#
# enable controller via:
# echo "+memory" > /sys/fs/cgroup2/cgroup.subtree_control
#
# Currently, three cgroup controllers are available in cgroups v2: I/O, memory, and PIDs. 
# Network part is implemented via iptables, such as:
# iptables -A OUTPUT -m cgroup --path mygroup -j LOG
#
############################################################################

echo "Enjoy Linux CGroup!"
