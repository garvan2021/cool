#!/bin/bash

dd bs=4M if=$1 of=$2 status=progress oflag=sync

