*** Comments ***

This example purpose is providing a source for external parsing from Python code.

*** Settings ***
Library        libraries/TmTc.py            ${TMTC COM port}
Resource       resources/PowerSupply.robot

Name           Firmware upload test suite

Documentation    This is a test suite documentation that describes the global information about the suite and its purpose
...              This is a multiline documentation.

Metadata        Version            2.0    # This is a metadata attached to the suite
Metadata        Target Board       EM, FM
Metadata        Test Plan          ATP, EMC-TP

Test Tags       Autmatic Test

Suite Setup     Setup Suite
Suite Teardown  Teardown Suite


*** Variables ***

${TMTC COM port}   COM6      # Defines the COM port used to connect to the TMTC server
${boot timeout}    10s       # Defines the maximum amount of time to wait for the platform to boot
${tmtc timeout}    1s        # Defines the default timeout of a TMTC transaction

*** Test Cases ***

TEST-0001
    [Documentation]    This is a test case documentation that describes the purpose of the test TEST-0001
    ...                The documentation needs to reflect the high level information about the test case. 
    ...                It should be clear and concise.
    ...                The test procedure is describe through the test keywords themslef

    [Tags]             long term
    ...                requirement:REQ-0001, REQ-0002

    Send a "Read Register" command at address 0x0005
    Log    The test case TEST-0001 has been executed successfully
    Should Be Equal    1    1
    
TEST-0002
    [Documentation]    This is a test case documentation that describes the purpose of the test TEST-0002
                  
    [Tags]             requirement:REQ-0005, REQ-0006
    
    Send a "Read Register" command at address 0x0006

*** Keywords ***

Send a "Read Register" command at address ${address}
    
    #${command}=    TmTc.Create a TMTC "Read Register" command to access to the address ${address}
    #TmTc.Send Command    ${command}
    #TmTc.Wait Response with a timeout  ${tmtc timeout}
    Log    Sending a "Read Register" command at address ${address}



Setup Suite
    [Documentation]    The suite setup consists to power up the platform and waiting for a proper boot, meaning
    ...                returning a "SUPERVISED" PLC mode within the boot timeout

    Log  TmTc.Connect to the TMTC server

    


Teardown Suite
    [Documentation]    The suite teardown consists to power down the platform and close the TMTC connection

    Log  Test 