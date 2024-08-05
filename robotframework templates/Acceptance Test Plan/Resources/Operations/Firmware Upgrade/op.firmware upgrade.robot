*** Comments ***

Metadata          UM_Section     Firmware Upgrade
Metadata          UM_Text
...               This section presents the operations related to the firmware upgrade.   
...               The chapter starts with basic and individual operations to finished with a 
...               summary of a complete Firmware upgrade from a delivered upgrade package file.

*** Settings ***
Resource          ../../EGSE/tmtc_services/tmtc.firmware_service.robot
Resource          ../../EGSE/tmtc_services/tmtc.plc_mode_service.robot

Resource          ../PLC Mode/op.plc mode.robot
Resource          ../PLC Power Management/op.plc power management.robot




Documentation     This section lists all operations related to the firmware upgrade mechanism.


*** Keywords ***

Initiate Firmware Upgrade
    [documentation]  This operation shows how to initiate a firmware upgrade
    [Tags]           UM
    
    Check if PLC is in SUPERVISED mode
    TmTc.service.firmware.open firmware upgrade

Update Firmware from a package file
    [documentation]  This operation shows how to update the firmware from a package file.
    ...              An "Initiate Firmware Upgrade" operation must be performed prior this operation.    
    [Arguments]      ${firmware file name}
    [Tags]           UM

    Check if PLC is in FIRMWARE_UPGRADE mode

Validate Firmware content
    [documentation]  This operation shows how to validate the firmware content
    [Arguments]      ${firmware}
    [Tags]           UM
    Fail     Not implemented yet
    RETURN           ${0}

Close Firmware Upgrade
    [documentation]  This operation shows how to close the firmware upgrade
    [Tags]           UM
    Fail     Not implemented yet
    RETURN           ${0}

Perform Firmware Upgrade from package file
    [documentation]  This operation shows how to perform a firmware upgrade
    [Arguments]      ${firmware filename}
    [Tags]           UM
    Initiate Firmware Upgrade    
    Update Firmware from a package file    ${firmware filename}
    Validate Firmware content              ${firmware filename}
    Close Firmware Upgrade
    Restart the PLC                        # See the PLC power management operations section



