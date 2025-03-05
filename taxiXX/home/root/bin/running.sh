#!/bin/sh

this=`ps ux | grep -v grep | grep -E "field_hub|dump_hist"`
#this=`ps ux | grep -E "field_hub|dump_hist"`
echo $this
