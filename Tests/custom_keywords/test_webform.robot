*** Settings ***
Library     SeleniumLibrary     75  5  run_on_failure=Nothing

*** Variables ***
${URL}          http://www.kcd8-local.dd/form/quick-contact-contact-us
${BROWSER}      Chrome
${IsAjaxComplete}    ${EMPTY}

*** Keywords ***
Open Home Page
    Open browser    ${URL}   ${BROWSER}

Close Browsers
    Close All Browsers

Select First Name
    [Arguments]      ${first_name}
    Input Text   xpath://input[@name='first_name']  ${first_name}

Select Last Name
    [Arguments]      ${last_name}
    Input Text   xpath://input[@name='last_name']    ${last_name}

Select Company
    [Arguments]      ${company}
    Input Text   xpath://input[@name='company']    ${company}

Select Email
    [Arguments]      ${email}
    Input Text   name: email    ${email}

Select Comment
    [Arguments]      ${comment}
    Input Text   name: user_comment    ${comment}

Select Terms
    Execute JavaScript   document.getElementById("edit-terms-and-conditions").checked = true;

Submit Webform
    Click Button    Send Inquiry
    : FOR    ${INDEX}    IN RANGE    1    5000
    \    ${IsAjaxComplete}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
    \    Log    ${INDEX}
    \    Log    ${IsAjaxComplete}
    \    Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop
    Page Should Not Contain Element    class=sorry