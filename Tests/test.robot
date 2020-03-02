*** Settings ***
Resource        custom_keywords/test_webform.robot
Suite Setup     Open Home Page
Suite Teardown  Close Browsers

*** Test Cases ***
The user can submit webform
   [Tags]	   test_webform
   #Set Selenium Speed  0.3
   Select First Name   Shabbir
   Select Last Name    Reshamwala
   Select Company   Mirum
   Select Email   a@b.c
   Select Comment   Mirum Testing
   Select Terms
   Submit Webform
