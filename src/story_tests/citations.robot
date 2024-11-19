*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser
Test Setup       Reset Todos

*** Test Cases ***
At start there are no citations
    Go To Home Page
    Home Page Should Be Open
    Page Should Contain  You haven't added any citations

After adding a citation, there is one
    Go To Home Page
    Click Link  Create new citation
    New Citation Page Should Be Open
    Input Text  key  Key123
    Input Text  title  Title
    Input Text  author  Author
    Input Text  year  2024
    Input Text  publisher  Publisher
    Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
    Sleep  1
    Click Button  create
    Page Should Not Contain  You haven't added any citations
    Page Should Contain  Key123
