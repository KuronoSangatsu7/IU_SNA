#!/bin/bash
ps | awk '{if ($4 == "sleep") {system ("kill -15 " $1); print "Got one and killed it!"} else {print "Not what we are looking for :("}}'