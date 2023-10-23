#!/bin/bash
echo version = $1 > VERSION
echo timestamp = `git log --date=iso-strict -n1 | grep Date | awk '{print $2}'` >> VERSION
