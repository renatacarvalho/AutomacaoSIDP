*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Library    OperatingSystem
Resource    guiaFamilias.robot

*** Variables ***
${FileRevisão}                  C:\\Automacao\\SIDP\\revisão - automação.docx
${BotaoAcoes}                   xpath=//button[contains(@class,'button-documents-menu')]
${Download_Diretory}            C:\\Download\\Não desvincular.docx
${Download_PDF}                 C:\\Download\\Não desvincular.docx.pdf
${RevisaoFamilia}               C:\\Automacao\\SIDP\\revisão familia.pdf
${AcoesTeste01}                 xpath=//*[@id="action-btn-098dc062-34bf-4889-8ca1-9990c68f699e"]
${OpcaoDesvincular}                  xpath=//li[contains(.,'Desvincular Documento')]
${BotaoDesvincular}            xpath=//button[@type='button'][contains(.,'Desvincular')]
${AcoesNaoDesvincular}        xpath=//*[@id="action-btn-cf0d9ab0-8b02-410e-87c7-9ab5f0c2423d"]
${BotaoCancelar}                xpath=//button[@type='button'][contains(.,'Cancelar')]
${BotaoSolicitarRevisao}        xpath=//button[@type='button'][contains(.,'Solicitar Revisão')]
${InputSolicitacao}            xpath=//*[@id="iReason"]
${ConfirmarSolicitacaoRevisao}    xpath=//*[@id="modal-overlay"]/div/div[2]/div[2]/button[2]
${BotaoCancelar}                 xpath=//button[@type='button'][contains(.,'Cancelar')]
${DocNaoDesvincular}            xpath=//div[@class='d-flex align-items-center gap-xxs external-icon'][contains(.,'Não desvincular.docx')]
${GuiaFamilia}        xpath=//div[@class='item regular'][contains(.,'Famílias/')]
${OpcaoDocOriginal}        xpath=//div[@class='menu-item '][contains(.,'Documento Original')]
${OpcaoDocPdf}            xpath=//div[@class='menu-item '][contains(.,'Documento PDF')]
${AnalisarSolicitacao}    xpath=//button[@type='button'][contains(.,'Analisar Solicitações')]
${BotaoAprovarSolicitacao}    xpath=//*[@id="modal-overlay"]/div/div[2]/div[1]/div[2]/div[2]/button[1]
${BotaoFechar}        xpath=//button[@type='button'][contains(.,'Fechar')]
${BotaoReprovarSolicitacao}    xpath=//*[@id="modal-overlay"]/div/div[2]/div[1]/div[2]/div[2]/button[2]
${InputMotivoRecusa}    xpath=//*[@id="iDescription"]
${BotaoRecusarSolicitacao}    xpath=//button[contains(@variant,'primary')]
${DocRevisaoFamilia}    xpath=//span[@class='document-name'][contains(.,'revisão familia.pdf')]
${UploadRevisao}    xpath=//*[@id="modal-overlay"]/div/div[2]/div[1]/div/button
${UploadDocRevisao}    xpath=//*[@id="input-file-upload-document"]
*** Keywords ***
E clicar nos tres pontinhos da coluna ações do documento teste 01
    Sleep    5
    Click Button    ${AcoesTeste01} 
E clicar em desvincular documento
    Wait Until Element Is Visible    ${OpcaoDesvincular}
    Click Element    ${OpcaoDesvincular}
E clicar em desvincular na mensagem de confirmação
    Wait Until Element Is Visible    ${BotaoDesvincular}
    Click Button    ${BotaoDesvincular}
Então o sistema deverá apresentar a mensagem "Documento desvinculado com sucesso"
    Wait Until Page Contains    Documento desvinculado com sucesso
    Capture Page Screenshot
E clicar nos tres pontinhos da coluna ações do documento nao desvincular
    Sleep    3
    Click Button    ${AcoesNaoDesvincular}
Então o sistema deverá apresentar a mensagem "Documento não desvinculado. Necessário ao menos um vinculo por documento."
    Wait Until Page Contains    Documento não desvinculado. Necessário ao menos um vinculo por documento.
    Click Button    ${BotaoCancelar}
E clicar no botão Solicitar Revisão
    Wait Until Element Is Visible    ${BotaoSolicitarRevisao}
    Click Button    ${BotaoSolicitarRevisao}
E informar o motivo da solicitação texto sem caracteres aspas
    Wait Until Element Is Visible    ${InputSolicitacao}
    Input Text    ${InputSolicitacao}    Teste automação - Solicitação de Revisão de um documento de familia
E clicar em solicitar revisão após inserção do motivo da solicitação
    Click Button    ${ConfirmarSolicitacaoRevisao}
Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."
    Sleep    2
    Page Should Contain    A solicitação foi realizada com sucesso.
E informar o motivo da solicitação texto com aspas
    Wait Until Element Is Visible    ${InputSolicitacao}
    Input Text    ${InputSolicitacao}    'Teste automação' - Solicitação de "Revisão" de um documento de & - 12'familia'
E clicar no botão cancelar
    Wait Until Element Is Visible    ${BotaoCancelar}
    Click Button    ${BotaoCancelar}
Então devo retornar para a tela de detalhes da familia com o documento não desvincular visivel
    Wait Until Page Contains Element    ${DocNaoDesvincular}
Quando eu retornar para a aba de familias
    Click Element    ${GuiaFamilia}
    Sleep    3
E clicar na opção Documento Original
    Sleep    3
    Click Element    ${OpcaoDocOriginal}
Então o download do documento deverá ser realizar no desktop na versão docx
    Sleep    5
    ${fileExists}=    File Should Exist    ${Download_Diretory} 
    Run Keyword If    ${fileExists}==${False}    Fail    Arquivo não encontrado
    Capture Page Screenshot
E clicar na opção Documento pdf
    Sleep    5
    Click Element    ${OpcaoDocPdf} 
Então o download do documento deverá ser realizar no desktop na versão pdf
    Sleep    5
    ${fileExists}=    File Should Exist    ${Download_PDF} 
    Run Keyword If    ${fileExists}==${False}    Fail    Arquivo não encontrado
    Capture Page Screenshot
E clicar no botão Analisar Solicitações
    Sleep    3
    Click Button    ${AnalisarSolicitacao}
E clicar em aprovar solicitação
    Wait Until Element Is Visible    ${BotaoAprovarSolicitacao}
    Click Button    ${BotaoAprovarSolicitacao}
Então o sistema deverá apresentar a mensagem "Solicitação respondida com sucesso"
    Wait Until Page Contains    Solicitação respondida com sucesso    10
E clicar no botão fechar
    Click Button    ${BotaoFechar}
    Sleep    2
E clicar em reprovar solicitação
    Click Button    ${BotaoReprovarSolicitacao}
E inserir o motivo da recusa 
    Input Text    ${InputMotivoRecusa}    teste 
E clicar no botão recusar solicitação
    Click Button    ${BotaoRecusarSolicitacao}
E clicar no documento revisão familia  
    Sleep    2
    Click Element    ${DocRevisaoFamilia}
    Sleep    2
E realizar upload do documento revisão familia para revisão    
    Click Button    ${UploadRevisao}
    #Wait Until Element Is Visible    ${UploadDocRevisao}
    Sleep    3
    Choose File    ${UploadDocRevisao}    ${RevisaoFamilia} 
Então o sistema deverá apresentar a mensagem "Documento enviado para revisão"  
    Wait Until Page Contains    Documento enviado para revisão
    Sleep    3
    Capture Page Screenshot