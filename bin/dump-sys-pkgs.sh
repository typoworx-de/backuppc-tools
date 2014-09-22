#!/bin/bash

if [ -z "$BACKUPPC_PRE_DUMP" ]; then
    echo please use 'pre_backup' to start
    exit
fi

DUMP_HOME=$BACKUPPC_PRE_DUMP

if [ ! -d "$DUMP_HOME/" ]; then
    mkdir $DUMP_HOME/
fi

if [ `type -P rpm` ]; then
    echo dumping RPM-List
    rpm -qa > $DUMP_HOME/pkgs_`hostname`.rpm.list
fi
if [ `type -P dpkg` ]; then
    echo dumping APT-List
    dpkg --get-selections > $DUMP_HOME/pkgs_`hostname`.deb.list
fi
