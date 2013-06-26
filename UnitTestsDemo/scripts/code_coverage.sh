#!/bin/sh

#  code_coverage.sh
#  InterplayCentral
#
#  Created by Sergiy Nezdoliy on 11/28/11.
#  Copyright (c) 2011 AVID. All rights reserved.
mkdir -p ../coverage

../../../external/Sandia/gcovr/gcovr \
    ../build/InterplayCentral.build/Release-iphonesimulator/LogicTests.build/Objects-normal/i386/ \
    -r $(pwd)/.. \
    -f '.*/InterplayCentral*' \
    -e '.*/*Tests' \
    -e '.*/*ASI*' \
    -e '.*/*FHFK*' \
    -e '.*/*Reachability*' \
    -e '.*/*.framework*' \
    -e '.*/*Cell*' \
    -e '.*/*Button*' \
    -e '.*/*Dialog*' \
    -e '.*/*View*' \
    -e '.*/*Toolbar*' \
    -e '.*/*SVSegmentedControl*' \
    -e '.*/*external*' \
    -x -o ../coverage/coverage.xml
