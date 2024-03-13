*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary

*** Variables ***
${MenuDocumentos}               xpath=//button[contains(.,'Documentos')]
${InputName}                    xpath=//*[@id="iTerm"]
${BotaoBuscar}                  xpath=//button[@type='submit'][contains(.,'Buscar')]
${ExcluirDocumento}             xpath=//li[contains(.,'Excluir Documento')]
${BotaoExcluir}                 xpath=//button[@type='button'][contains(.,'Excluir')]

*** Keywords ***
Quando eu clicar no menu documentos
    Wait Until Element Is Visible    ${MenuDocumentos}
    Click Button    ${MenuDocumentos}

E pesquisar pelo documento teste automacao
    Sleep    3
    Input Text    ${InputName}    teste familia

E clicar no botao buscar
    Click Button    ${BotaoBuscar}

E clicar em excluir o documento
    Wait Until Element Is Visible    ${BotaoAcoes}
    Click Button    ${BotaoAcoes}
    Click Element    ${ExcluirDocumento}

E clicar em excluir na mensagem de confirmação
    Wait Until Element Is Visible    ${BotaoExcluir}
    Click Button    ${BotaoExcluir}
    Sleep    3

Então o sistema deverá apresentar a mensagem "Documento excluído com sucesso"
    #Sleep    3
    Wait Until Page Contains    Documento excluído com sucesso
    Capture Page Screenshot
E pesquisar pelo documento revisão - automação  
    Sleep    3
    Input Text    ${InputName}    revisão familia_r101
Quando eu pesquisar pelo documento teste vinculado ao item 07355.9172 no menu documentos
    Wait Until Element Is Visible    ${MenuDocumentos}
    Click Element    ${MenuDocumentos}
    Sleep    3
    Input Text    ${InputName}    teste item
E pesquisar pelo documento revisão item
    Input Text    ${InputName}     revisão item_r1.0.1
    Sleep    2


