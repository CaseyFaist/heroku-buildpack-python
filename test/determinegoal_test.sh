#!/bin/bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetermineBlankGoal() {
    
    echo "Calling determine-goal with ''..."
    capture ${BUILDPACK_HOME}/bin/determine-goal <<< ""
    assertContains "THIS IS PYTHON 2!" "`cat ${STD_OUT}`"
    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Your options are" "`cat ${STD_OUT}`"

    assertContains "Goodbye" "`cat ${STD_OUT}`"
}

testDetermineUpgradeGoal() {
    
    echo "Calling determine-goal with 'u'..."
    capture ${BUILDPACK_HOME}/bin/determine-goal <<< "u"
    assertContains "THIS IS PYTHON 2!" "`cat ${STD_OUT}`"
    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Your options are" "`cat ${STD_OUT}`"
    assertContains "Upgrade!!!!!!!!!" "`cat ${STD_OUT}`"

    assertNotContains "Goodbye" "`cat ${STD_OUT}`"
}

testDetermineDowngradeGoal() {
    
    echo "Calling determine-goal with 'd'..."
    capture ${BUILDPACK_HOME}/bin/determine-goal <<< "d"
    assertContains "THIS IS PYTHON 2!" "`cat ${STD_OUT}`"
    assertContains "Unfortunately," "`cat ${STD_OUT}`"
    assertContains "Your options are" "`cat ${STD_OUT}`"
    assertContains "Downgrade!!!!!!!!!" "`cat ${STD_OUT}`"

    assertNotContains "Goodbye" "`cat ${STD_OUT}`"   
}