*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Library     OperatingSystem
Resource    login.robot
Resource    guiaFamilias.robot
Resource    guiaDocumentos.robot
Resource    guiaItens.robot

*** Variables ***
${REVISAO_ITEM}    C:\\Automacao\\SIDP\\revisão item.pdf
${DocOriginal}        C:\\Download\\Não desvincular item.docx
${DocPDF}             C:\\Download\\Não desvincular item.docx.pdf
${DuploClick_07355.9172}    xpath=//div[@class='div-flex left'][contains(.,'TESTE 44 1 SIDP TREINAMENTO')]
${AcoesTeste2}    xpath=//*[@id="action-btn-59b39bc3-b8e1-4db0-8f4c-9aaa1890689b"]
${AcoesNaoDesvItem}    xpath=//*[@id="action-btn-567626bf-67d6-4125-a53a-ae82e5c2e7a7"] 
${DocRevisaoItem}      xpath=//div[@class='d-flex align-items-center gap-xxs external-icon documents'][contains(.,'revisão item.pdf')]
${EnviarRevisaoItem}    xpath=//button[@type='button'][contains(.,'Enviar Revisão')]
${BotaoVincularDocItem}    xpath=//button[@type='submit'][contains(.,'Vincular')]
${NaoDesvincularDoc}    xpath=//span[@class='document-name'][contains(.,'Não desvincular item.docx')]
${AnalisarRevisao}    xpath=//*[@id="action-btn-8fe9fb19-8553-429b-8a02-f161f9eff01a"]
${InputDocRevisao}    xpath=//*[@id="input-file-upload-document"] 

*** Keywords ***
E der um duplo click no item 07355.9172
    Double Click Element    ${DuploClick_07355.9172} 
E clicar nos tres pontinhos da coluna ações do documento teste item 02
    Sleep    3
    Click Button    ${AcoesTeste2}
E clicar nos tres pontinhos da coluna ações do documento Não desvincular item
    Sleep    3
    Click Button    ${AcoesNaoDesvItem}
Então devo retornar para a tela de detalhes do item 07355.9172
    Wait Until Element Is Visible    xpath=//div[@class='item current'][contains(.,'07355.9172')]
E clicar no documento revisão item
    Click Element    ${DocRevisaoItem}
    Sleep    2
E clicar no botão Enviar Revisão
    Wait Until Element Is Visible    ${EnviarRevisaoItem}
    Click Button    ${EnviarRevisaoItem}
E realizar upload do documento revisão item para revisão
    Click Button    xpath=//*[@id="modal-overlay"]/div/div[2]/div[1]/div/button
    Wait Until Element Is Visible    xpath=//*[@id="label-file-upload"]/div[1]/div/span[1]
    Choose File    ${InputDocRevisao}    ${REVISAO_ITEM}
E clicar em analisar pendencia do documeto enviado para revisão
    Click Button    ${AnalisarRevisao}
E clicar no documento Não desvincular item
    Click Element    ${NaoDesvincularDoc} 
#E clicar no botão vincular documento
 #   Click Button    ${BotaoVincularDocItem}
Então o download do documento Não desvincular item deverá ser realizar no desktop na versão docx
    Sleep    3
    ${fileExists}=    File Should Exist    ${DocOriginal}
    Run Keyword If    ${fileExists}==${False}    Fail    Arquivo não encontrado
    Capture Page Screenshot

Então o download do documento Não desvincular item deverá ser realizar no desktop na versão pdf
    Sleep    3
    ${fileExists}=    File Should Exist    ${DocPDF}
    Run Keyword If    ${fileExists}==${False}    Fail    Arquivo não encontrado
    Capture Page Screenshot