*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Resource    login.robot
Resource    guiaItens.robot
Resource    guiaDocumentos.robot

*** Variables ***
${BotaoFamilias}                xpath=//button[contains(@label,'Famílias')]
${Familia3}                     xpath=//div[@class='div-flex left'][contains(.,'000003')]
${BotaoVincularDocumento}       xpath=//button[@type='button'][contains(.,'Vincular documentos')]
${BotaoDesktop}                 xpath=(//button[@type='button'][contains(.,'Selecione o Arquivo')])[2]
${CampoTipoDoc}                 xpath=//*[@id="iDocumentType"]
${TipoETF}                      xpath=//li[contains(.,'ETF - Especificação Técnica do Fornecedor')]
${BotaoUpload}                  xpath=//*[@id="input-file-upload-documents[0].file"]
${BotaoVincular}                xpath=//button[@type='submit'][contains(.,'Vincular')]
${FILE}                         C:\\Automacao\\SIDP\\teste familia.pdf
${AnalisarPendencia}            xpath=//li[contains(.,'Analisar pendência')]
${BotaoRecusar}                 xpath=//button[@type='button'][contains(.,'Recusar')]
${MotivoRecusa}                 xpath=//input[contains(@name,'documentError')]
${InputMotivoRecusaFamilia}            xpath=//textarea[contains(@name,'comment')]
${BotaoRecusa}                  xpath=//button[contains(@variant,'primary')]
${BotaoAprovar}                 xpath=//button[@type='submit'][contains(.,'Aprovar')]
${BotaoEncaminhar}              xpath=//button[@type='button'][contains(.,'Encaminhar')]
${ConfirmarEncaminhar}          xpath=//button[contains(@variant,'primary')]
${BotaoValidade}                xpath=//button[contains(@class,'btn-expiration-date')]
${InputValidade}                xpath=//*[@id=":r28:"]
${BotaoAdicionar}               xpath=//button[@type='submit'][contains(.,'Adicionar')]
${BotaoVinculoSIDP}             xpath=(//button[@type='button'][contains(.,'Selecione o Arquivo')])[1]
${InputABRAP}                   xpath=//*[@id="input-search-SIDP"]
${SelectABRAP}                  xpath=//span[contains(.,'000001')]
${SelectTeste01}                xpath=//div[@class='d-flex align-items-center gap-xxs'][contains(.,'teste 01.pdf')]
${TipoDT}                       xpath=//li[contains(.,'DT - Desenho Técnico')]
${InputRevisão}                 xpath=//*[@id="input-file-upload-documents[0].file"]
${VincularRevisão}              xpath=//*[@id="modal-overlay"]/div/div[2]/div[2]/button[2]


*** Keywords ***
Quando eu clicar na aba familias
    Click Button    ${BotaoFamilias}
E clicar na familia ABRASIVO - MISC - PROD INTERNA
    Wait Until Element Is Visible    ${Familia3}
    Click Element    ${Familia3}
E clicar no botão vincular documentos
    Wait Until Element Is Visible    ${BotaoVincularDocumento}
    Click Button    ${BotaoVincularDocumento}
E clicar no botao busque no desktop
    Wait Until Element Is Visible    ${BotaoDesktop}
    Click Button    ${BotaoDesktop}
E clicar no campo tipo de documento
    Wait Until Element Is Visible    ${CampoTipoDoc}
    Click Element    ${CampoTipoDoc}
E selecionar tipo de documento
    Wait Until Element Is Visible    ${TipoETF}
    Click Element    ${TipoETF}
E clicar no botao de upload
    Choose File    ${BotaoUpload}    ${FILE}
E inserir data de validade
    Click Button    ${BotaoValidade} 
    Sleep    3
    Input Text    ${InputValidade}    20122024
E clicar no botão adicionar
    Click Button    ${BotaoAdicionar} 
E clicar no botao vincular
    Click Button    ${BotaoVincular}
    Sleep    3
Então o sistema devera apresentar a mensagem "Documento enviado para análise"
    Wait Until Page Contains    Documento enviado para análise
    Capture Page Screenshot
E clicar em analisar pendencia 
    Sleep    5
    Click Button    ${BotaoAcoes}
    Click Element    ${AnalisarPendencia}
E clicar em recusar
    Click Button    ${BotaoRecusar}
E selecionar o motivo da recusa
    Click Element    ${MotivoRecusa}
E inserir um comentario
    Input Text    ${InputMotivoRecusaFamilia}    teste recusa
E clicar no botao recusar
    Click Button    ${BotaoRecusa}
    Sleep    3
Então o sistema devera apresentar a mensagem "Documento recusado"
    Wait Until Page Contains    Documento recusado
    Capture Page Screenshot
E clicar em aprovar
    Click Button    ${BotaoAprovar}
Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
    Wait Until Page Contains    O documento foi aprovado com sucesso.
    Capture Page Screenshot
E clicar no botao encaminhar para o backup
    Click Button    ${BotaoEncaminhar}
E clicar em encaminhar na mensagem de confirmação
    Wait Until Element Is Visible    ${ConfirmarEncaminhar}
    Click Button    ${ConfirmarEncaminhar}
Então o sistema devera apresentar a mensagem "Backup(s) notificado(s) com sucesso."
    Wait Until Page Contains    Backup(s) notificado(s) com sucesso.
    Capture Page Screenshot
E clicar no botao via SIDP
    Click Button    ${BotaoVinculoSIDP}
E inserir a familia ABRAP no campo de busca
    Wait Until Element Is Visible    ${InputABRAP}
    Input Text    ${InputABRAP}    000001
    Sleep    2
E clicar na familia ABRAP
    Wait Until Element Is Visible    ${SelectABRAP}
    Click Element    ${SelectABRAP}
E selecionar o primeiro documento
    Wait Until Element Is Visible    ${SelectTeste01}
    Click Element    ${SelectTeste01}
    Execute Javascript    scrollTo(0,3000)
    Capture Page Screenshot
E der um duplo clique na famila ABRASIVO - MISC - PROD INTERNA
    Double Click Element    ${Familia3}
E selecionar tipo de documento DT
    Wait Until Element Is Visible    ${TipoDT}
    Click Element    ${TipoDT}
E carregar o documento revisão familia
    Choose File    ${InputRevisão}    ${RevisaoFamilia}
E clicar em vincular nova versão de documento
    Click Button    ${VincularRevisão}