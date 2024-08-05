*** Comments ***

This section lists all operations related to housekeeping management



*** Keywords ***

Retrieve Housekeeping value
    [documentation]  This operation shows how to retrieve a specific housekeeping value based on the housekeeping ID
    [Arguments]      ${housekeepingId}
    Fail     Not implemented yet
    RETURN           ${0}

Retrive PLC mode
    [documentation]  This operation shows how to retrieve the PLC mode using accessing to the PLC Telemetry
    [Tags]           UM
    Fail     Not implemented yet
    RETURN           BOOTING

Retrieve Important Housekeeping values
    [documentation]  This operation shows how to retrieve important housekeeping that reflects the current health of the system.
    ...              It should be polled periodically to ensure the system is running as expected.

    [Tags]           UM
    
    Fail             Not implemented yet
    RETURN           ${0}

Check the PLC health 
    [documentation]  This operation shows how to check the PLC health by accessing the PLC Telemetry
    [Tags]           UM
    
    ${PLC health} =      Retrieve Important Housekeeping values
    
    RETURN           ${0}