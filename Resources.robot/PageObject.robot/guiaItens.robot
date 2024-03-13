*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Resource    login.robot
Resource    guiaFamilias.robot
Resource    guiaDocumentos.robot

*** Variables ***
${FILE_ITEM}    C:\\Automacao\\SIDP\\teste item.pdf
${ITEM_TESTE44}    xpath=//div[@class='div-flex left'][contains(.,'TESTE 44 1 SIDP TREINAMENTO')]
${GuiaItens}    xpath=//button[contains(.,'Itens')]
${UploadETF}    xpath=//*[@id="input-file-upload-documents[0].file"]
${InputSIDP}    xpath=//*[@id="input-search-SIDP"]
${Item_07353.0172}    xpath=//span[contains(.,'07353.0172')]
${DocTeste2}    xpath=//div[@class='document-option-container '][contains(.,'documento item teste 2.pdf')]
${UploadOCD}    xpath=//*[@id="input-file-upload-documents[1].file"]
${InputRecusa}    xpath=//*[@id="iComment"]


*** Keywords ***
Quando eu clicar na aba item
    Click Button    ${GuiaItens}
    Wait Until Element Is Visible    ${GuiaItens}
E pesquisar pelo item 07355.9172
    Input Text    xpath=//input[contains(@name,'term')]    07355.9172
E clicar em buscar
    Click Button    ${BotaoBuscar}
    Sleep    2
E clicar no item 07355.9172
    Wait Until Element Is Visible    ${ITEM_TESTE44}
    Click Element    ${ITEM_TESTE44}
E realizar upload atraves do tipo etf
    Choose File    ${UploadETF}    ${FILE_ITEM}
E pesquisar o código 07353.0172
    Input Text    ${InputSIDP}    07353.0172
    Wait Until Element Is Visible    ${Item_07353.0172}
    Click Element    ${Item_07353.0172}
E selecionar o documento item teste 2
    Click Element    ${DocTeste2}
E realizar upload atraves do tipo ocd
    Choose File    ${UploadOCD}    ${REVISAO_ITEM}
Dado que eu esteja no menu item
    Click Button    ${GuiaItens}
    Sleep    2
E inserir um comentario para recusa do documento
    Input Text    ${InputRecusa}    teste automação recusa

    