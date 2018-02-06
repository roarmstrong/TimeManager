#!/bin/bash
find -name '*.pyc' |xargs rm # assure that the build is clean
if [ "$1" == "local" ]; then
   mv test/spatialite_experiments.py  test/test_with_spatialite.py # only run spatialite tests in local build, Travis has problems
fi
nosetests --nocapture --cover-package=TimeManager "$@"
rc=$?
if [ "$1" == "local" ]; then
    mv test/test_with_spatialite.py test/spatialite_experiments.py
fi
exit $rc
