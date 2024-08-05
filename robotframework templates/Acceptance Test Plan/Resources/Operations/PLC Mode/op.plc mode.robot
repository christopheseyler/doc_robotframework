*** Comments ***

Metadata    UM_Section    PLC Mode operations
Metadata    UM_Text       
...         These operations are related to the PLC mode. They are mainly based on the TmTc PLC mode service to retrieve it.
...         Multi line descrition 

*** Settings ***

Resource    ../../EGSE/tmtc_services/tmtc.plc_mode_service.robot


*** Keywords ***

Check if PLC is in ${mode} mode
    [documentation]  This operation shows how to check if the PLC is in a specific mode
    [Tags]           UM
    ${plc mode}=     tmtc.plc_mode_service.get_mode

    Should Be Equal    ${mode}    ${plc mode}
    




