*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser
Test Setup       Reset Application

*** Test Cases ***
After deleting a citation, it is no longer visible
    Go To Home Page
    Create Test Citation  1
    Page Should Contain  Title1
    Click Citation Row  1
    Citation Page Should Be Open
    Click Delete
    Handle Alert  action=ACCEPT
    Go To Home Page
    Page Should Not Contain  Title1

*** Keywords ***
Click Create
    Scroll Element Into View  ${CREATE}
    Wait Until Element is visible  ${CREATE}  timeout=5s
    Set Focus To Element  ${CREATE}    
    Click Element  ${CREATE}

Create Test Citation
    [Arguments]  ${append}
    Click Element  xpath=//button[contains(text(), 'Create new citation')]
    Wait Until Element Is Visible    year
    Wait Until Element Is Enabled    year
    Input Text  title  Title${append}
    Input Text  author  Author${append}
    Input Text  journal  Journal${append}
    Input Text  year  Year${append}
    Click Create

Click Citation Row
    [Arguments]  ${row}
    Double Click Element  //td[contains(text(), "${row}")]

Click Edit
    Scroll Element Into View  ${EDIT}
    Wait Until Element is visible  ${EDIT}  timeout=5s
    Set Focus To Element  ${EDIT}    
    Click Element  ${EDIT}    
Click Delete
    Scroll Element Into View  xpath=//button[contains(@class, 'btn-danger') and text()='Delete']
    Wait Until Element Is Visible  xpath=//button[contains(@class, 'btn-danger') and text()='Delete']  timeout=5s
    Set Focus To Element  xpath=//button[contains(@class, 'btn-danger') and text()='Delete']
    Click Element  xpath=//button[contains(@class, 'btn-danger') and text()='Delete']


Confirm Deletion
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'Confirm')]
    Set Focus To Element             xpath=//button[contains(text(), 'Confirm')]
    Click Element                    xpath=//button[contains(text(), 'Confirm')]
    Wait Until Element Is Not Visible    xpath=//button[contains(text(), 'Confirm')]