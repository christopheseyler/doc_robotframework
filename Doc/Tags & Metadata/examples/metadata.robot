*** Settings ***
Metadata        Version            2.0
Metadata        Robot Framework    http://robotframework.org
Metadata        Platform           ${PLATFORM}
Metadata        Longer Value
...             Longer metadata values can be split into multiple
...             rows. Also *simple* _formatting_ is supported.

*** Test Cases ***
Example
    ${version}=    Get Suite Metadata    Version
    Log    Version: ${version}

*** Keywords ***
Get Suite Metadata
    [Arguments]    ${key}
    ${value}=    Get Variable Value    ${SUITE METADATA}[${key}]
    RETURN    ${value}