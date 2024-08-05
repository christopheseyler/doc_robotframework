*** Comments ***

This example demonstrates how to access suite metadata from the command line.
It assumes the test is launched from the command line with the following command:
`robot --variable PLATFORM:Linux test_metadata_from_cli.robot`

```bash
robot --metadata "Additional Metadata:Metadata value" test_metadata_from_cli.robot
```
*** Settings ***


*** Test Cases ***
Example
    ${additional_metadata_value}=    Get Suite Metadata    Additional Metadata
    Log    Additional Metadata: ${additional_metadata_value}
    Should Be Equal As Strings    ${additional_metadata_value}    Metadata value

*** Keywords ***
Get Suite Metadata
    [Arguments]    ${key}
    ${value}=    Get Variable Value    ${SUITE METADATA}[${key}]
    RETURN    ${value}