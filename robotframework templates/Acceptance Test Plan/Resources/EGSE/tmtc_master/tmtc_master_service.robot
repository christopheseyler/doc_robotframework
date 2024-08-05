*** Keywords ***

Start TmTc Master Service
    [documentation]  This operation starts the TMTC master service
    Fail     Not implemented yet
    


Stop TmTc Master Service
    [documentation]  This operation stops the TMTC master service
    Fail     Not implemented yet
    


Start TmTc Transaction 
    [documentation]  This operation starts the TMTC transaction based on the givem TMTC command.
    ...              This operation generates a transaction ID, which is returned.
    [Arguments]      ${TmTc Command}
    
    ${Transaction ID}=     Convert To Integer     0
       
    RETURN           ${Transaction ID}


Wait for TmTc Transaction Completion
    [documentation]  This operation waits for the TMTC transaction to complete.
    ...              The transaction ID is passed as an argument.
    [Arguments]      ${Transaction ID}

    No Operation

    

Get TmTc Transaction Result
    [documentation]  This operation gets the result of the TMTC transaction.
    ...              The transaction ID is passed as an argument.
    ...              The result focuses on the transaction operation at transport level  (success, timeout, crc error, bad framing or internal error). Therefore, it is
    ...              only relevent to inspect the transaction answer in the case of a succefssful transaction.

    [Arguments]      ${Transaction ID}
    
    ${Result}=     Convert To Integer     0
       
    RETURN           ${Result}    



