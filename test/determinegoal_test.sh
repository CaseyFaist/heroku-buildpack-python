#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh
mkdir ${BUILDPACK_HOME}/determine

testDetermineBlankGoal() {
    touch ${BUILDPACK_HOME}/determine/goal.txt
    echo $'\n\n\n' >| ${BUILDPACK_HOME}/determine/goal.txt

    capture ${BUILDPACK_HOME}/bin/determine-goal

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Goodbye" "`cat ${STD_OUT}`"
    assertEquals 0 ${rtrn}
}

testDetermineUpgradeGoal() {
    touch ${BUILDPACK_HOME}/determine/goal.txt
    echo $'u\n\n' >| ${BUILDPACK_HOME}/determine/goal.txt

    capture ${BUILDPACK_HOME}/bin/determine-goal

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Upgrade" "`cat ${STD_OUT}`"
    
    assertNotContains "Goodbye" "`cat ${STD_OUT}`"
    assertEquals 0 ${rtrn}
}

testDetermineDowngradeGoal() {
    touch ${BUILDPACK_HOME}/determine/goal.txt
    echo $'d\n\n' >| ${BUILDPACK_HOME}/determine/goal.txt

    capture ${BUILDPACK_HOME}/bin/determine-goal

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Downgrading to Heroku-16" "`cat ${STD_OUT}`"
    assertNotContains "Stack set. Next release on " "`cat ${STD_OUT}`"
    assertNotContains "Goodbye" "`cat ${STD_OUT}`"
    assertEquals 0 ${rtrn}
}

testDetermineInvalidResponse() {
    touch ${BUILDPACK_HOME}/determine/goal.txt
    echo $'y\n\n' >| ${BUILDPACK_HOME}/determine/goal.txt

    capture ${BUILDPACK_HOME}/bin/determine-goal

    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Goodbye" "`cat ${STD_OUT}`"
    assertEquals 0 ${rtrn}
}