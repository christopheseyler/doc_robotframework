*** Comments ***

*** Settings ***
Resource  ../../Resources/EGSE/tmtc_master/tmtc_master_service.robot

Suite Setup     Prepare EGSE
Suite Teardown  Stop EGSE

*** Variables ***



*** Test Cases ***

ATP-TMTC-001
    [Documentation]  This test case verifies the TMTC transaction is successful
   
    ${TmTc Command Payload}=    Convert To Bytes    00 FF 55 66    hex
    ${TmTc Command} =    Create TmTc Command with "SvcCode"=0x01 and "Payload"=${TmTc Command Payload} To SU from PF

    ${Transaction ID}=    Start TmTc Transaction  ${TmTc Command} 
    Wait for TmTc Transaction Completion    ${Transaction ID}
    ${Result}=    Get TmTc Transaction Result    ${Transaction ID}
    Should Be Equal As Numbers    ${Result}    0




*** Keywords ***
Prepare EGSE
    [Documentation]  This operation prepares the test infrastructure for the test suite
    Start TmTc Master Service
    

Stop EGSE
    [Documentation]  This operation stops the test infrastructure for the test suite
    Stop TmTc Master Service