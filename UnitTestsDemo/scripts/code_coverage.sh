#!/bin/sh

#  code_coverage.sh
#  DemoUnitTests
#  author: sergey.nezdoliy

mkdir -p ../coverage

../external/Sandia/gcovr/gcovr \
    ../build/UnitTestsDemo.build/Release-iphonesimulator/logicTests.build/Objects-normal/i386/ \
    -r $(pwd)/.. -v