*** Comments ***

This file demonstrates how to use tags in Robot Framework.
Tags are free-form strings that can be used to categorize test cases.
They can be used to select test cases to run, to generate reports, and to perform other tasks.

*** Settings ***
Test Tags    TagDefinedInSettings    AnotherTagDefinedInSettings


*** Test Cases ***
My Test
    [Tags]    TagDefinedInTest
    Log     Basic test with tags


