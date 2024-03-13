*** Settings ***
Resource    ../Data/geral.robot
Library    SeleniumLibrary

*** Keywords ***

Acessar URL
    ${variables}=  Get variables

    Run Keyword If    "\${BROWSER_OPENED}" in $variables
    ...    Go To    ${geral.URL}
    ...  ELSE
    ...    Abrir Chrome
    
Abrir Chrome
    Create Directory    ${DOWNLOAD_DIRECTORY}
    Empty Directory    ${DOWNLOAD_DIRECTORY}

    ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${DOWNLOAD_DIRECTORY}
    @{switches} =  create list  enable-logging
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chromeOptions}    add_experimental_option    excludeSwitches    ${switches}
    Open Browser    ${geral.URL}    ${geral.Browser}    options=${chromeOptions}
    Set Global Variable    ${BROWSER_OPENED}    True

Fechar navegador
    Close Browser