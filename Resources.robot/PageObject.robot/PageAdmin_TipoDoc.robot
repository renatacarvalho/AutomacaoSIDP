*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Library    XML

*** Variables ***
${BotaoConfiguracoes}    xpath=//button[contains(.,'Configurações')]
${BotaoNovoTipo}    xpath=//button[@type='button'][contains(.,'Novo tipo')]   
${InputSigla}    xpath=//input[contains(@name,'acronym')] 
${InputNome}    xpath=//input[contains(@name,'name')]
${SelectAprovador}    xpath=//div[contains(@label,'Aprovadores')]
${InputAprovador}    xpath=//*[@id="iApproverUsers"] 
${UserFitec2}    xpath=//span[contains(.,'Fitec2')]
${SelectBackup}    xpath=//*[@id="__next"]/div[2]/main/div/div/form/div[1]/div[2]/div[2]/div[2]
${InputBackup}    xpath=//*[@id="iBackupUsers"]
${UserFitec1}    xpath=//span[contains(.,'Fitec1')]
${InputDesrcicao}    xpath=//textarea[contains(@name,'description')]


*** Keywords ***
Dado que eu clique em configurações no menu
    Click Button        ${BotaoConfiguracoes}
Quando eu clicar no botão Novo tipo
    Wait Until Element Is Visible    ${BotaoNovoTipo}
    Click Button    ${BotaoNovoTipo}
E acessar a tela de cadastro de novo tipo de documento
    Wait Until Element Is Visible    ${InputSigla}
E preencher o campo sigla 
    Input Text    ${InputSigla}    TESTE
E preencher o campo nome
    Input Text    ${InputNome}    TESTE AUTOMACAO
E selecionar um aprovador
    Sleep    3
    Click Element    ${SelectAprovador}
    Input Text    ${InputAprovador}    fitec2
    Sleep    3
    Wait Until Element Is Visible    ${UserFitec2}
    Click Element    ${UserFitec2}
E selecionar um backup
    Sleep    3
    Click Element    ${SelectBackup}    
    Input Text    ${InputBackup}     fitec1
    Click Element    ${UserFitec1} 
E preencher o campo descrição
    Input Text    ${InputDesrcicao}    teste
E clicar em adicionar
    Execute Javascript    scrollTo(0,3000)
    Wait Until Element Is Visible    ${BotaoAdicionar}
    Click Button    ${BotaoAdicionar}
Então deverá ser apresentado uma mensagem de cadastro com sucesso
    Wait Until Page Contains    Tipo de documento salvo com sucesso!
    Sleep    3
    Capture Page Screenshot
Quando eu pesquisar pelo tipo de documento cadastrado no campo de filtro
    Wait Until Element Is Visible    ${InputName} 
    Input Text    ${InputName}     TESTE AUTOMACAO
    Sleep    3
Então o sistema deverá apresentar o tipo de documento cadastrado - TESTE AUTOMACAO
    Page Should Contain    TESTE AUTOMACAO
    Sleep    3
    Capture Page Screenshot
Quando eu clicar na coluna ações
    Wait Until Element Is Visible    xpath=//*[@id="action-btn-0"]
    Click Button    xpath=//*[@id="action-btn-0"]
E clicar em editar tipo de documento
    Wait Until Element Is Visible    xpath=//*[@id="actions-table-menu"]/div[3]/ul/div[1]/li
    Click Element    xpath=//*[@id="actions-table-menu"]/div[3]/ul/div[1]/li
E clicar em excluir
    Click Element    xpath=//*[@id="actions-table-menu"]/div[3]/ul/div[2]
    Click Button    ${BotaoExcluir}
Então o documento deverá ser excluido e quando pesquisar por ele nao deverá aparecer na listagem
    Wait Until Page Contains    Tipo de documento excluído com sucesso
    Capture Page Screenshot
E clicar em editar o campo sigla
    Wait Until Element Is Visible    ${InputSigla} 
    Clear Element Text    ${InputSigla}
    Sleep    2
    ${siglaEditado}    Word          
    Input Text    ${InputSigla}    ${siglaEditado}
    Set Global Variable    ${siglaEditado}
    Sleep    3
    Capture Page Screenshot
E clicar em atualizar    
    Execute Javascript    scrollTo(0,3000)
    Wait Until Element Is Visible    xpath=//button[@type='submit'][contains(.,'Atualizar')]
    Click Button    xpath=//button[@type='submit'][contains(.,'Atualizar')]
Então o sistema deverá apreasentar a mensagem "Tipo de documento atualizado com sucesso!"
    Wait Until Page Contains    Tipo de documento atualizado com sucesso!
    Capture Page Screenshot   
Quando eu pesquisar pelo tipo de documento com a sigla editada no campo de filtro
    Wait Until Element Is Visible    ${InputName} 
    Input Text    ${InputName}     ${siglaEditado}
    Sleep    3
E preencher o campo sigla pela segunda vez
    Input Text    ${InputSigla}    NOVO TIPO
E preencher o campo nome pela segunda vez
    Input Text    ${InputNome}    NOVO TIPO
E clicar em editar o campo nome
    Wait Until Element Is Visible    ${InputNome} 
    Clear Element Text    ${InputNome}
    Sleep    2
    ${nomeEditado}    Word          
    Input Text    ${InputNome}    ${nomeEditado}
    Set Global Variable    ${nomeEditado}
    Sleep    3
    Capture Page Screenshot
Quando eu pesquisar pelo tipo de documento com o nome editado no campo de filtro
    Wait Until Element Is Visible    ${InputName} 
    Input Text    ${InputName}     ${nomeEditado}
    Sleep    3
Quando eu pesquisar pelo tipo de documento cadastrado no campo de filtro segunda vez
    Wait Until Element Is Visible    ${InputName} 
    Input Text    ${InputName}     NOVO TIPO
    Sleep    3
Então o sistema deverá apresentar o tipo de documento cadastrado - NOVO TIPO
    Page Should Contain    NOVO TIPO
    Sleep    3
    Capture Page Screenshot
