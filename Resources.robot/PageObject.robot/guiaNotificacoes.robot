*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary
Resource   login.robot

*** Variables ***
${GuiaNotificacoes}    xpath=//button[contains(.,'Notificações')]
${VerTudo}    xpath=//div[@class='actions-container'][contains(.,'Ver tudo')]
${BuscarMensagem}    xpath=//input[contains(@name,'term')]  
${DocExcluido}    xpath=(//p[@variant='h6'][contains(.,'Documento excluído do sistema')])[1]
${DocAprovado}    xpath=(//p[contains(.,'Documento aprovado')])[1]  
${DocAdicionado}    xpath=(//p[@variant='h6'][contains(.,'Documento adicionado ao sistema')])[1]

*** Keywords ***
Dado que eu clique no menu notificações
    Click Button    ${GuiaNotificacoes}
Quando eu clicar em ver tudo
    Wait Until Element Is Visible    ${VerTudo}
    Click Element    ${VerTudo}
    Sleep    3
E pesquisar por Documento excluido do sistema no campo de busca
    Input Text    ${BuscarMensagem}    excluido do sistema
Então deverá existir notificação com o titulo "Documento excluido do sistema"
    Sleep    3
    Page Should Contain Element    ${DocExcluido}
    Capture Page Screenshot
E pesquisar por Documento aprovado do sistema no campo de busca
    Input Text    ${BuscarMensagem}    aprovado
Então deverá existir notificação com o titulo "Documento aprovado"
    Sleep    3
    Page Should Contain Element    ${DocAprovado}
    Capture Page Screenshot
E pesquisar por Documento adicionado do sistema no campo de busca
    Input Text    ${BuscarMensagem}    documento adicionado
Então deverá existir notificação com o titulo "Documento adicionado ao sistema"
    Sleep    3
    Page Should Contain Element    ${DocAdicionado}
    Capture Page Screenshot
    