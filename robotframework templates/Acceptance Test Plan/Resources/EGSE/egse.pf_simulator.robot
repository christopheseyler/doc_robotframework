*** Comments ***

This file contains all the operation provieded by the EGSE intrastructure that simulates the plateform actions.

*** Settings ***
Resource          tmtc_services/tmtc.register_service.robot
Resource          tmtc_services/tmtc.firmware_service.robot
Resource          tmtc_services/tmtc.plc_mode_service.robot





*** Keywords ***

Send a TMTC packet    
    [documentation]  This operation shows how to send a TMTC packet to the satellite
    [Arguments]      ${packet}
    [Tags]           UM
    Fail     Not implemented yet
    RETURN           ${0}


