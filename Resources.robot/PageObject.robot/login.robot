*** Settings ***
Resource    ../Shared/setup_teardown.robot
Library     SeleniumLibrary

*** Variables ***
${BotaoLoginMicrosoft}          xpath=//button[@type='button'][contains(.,'Fazer login com microsoft')]
${InputEmail}                   xpath=//*[@id="i0116"]
${BotaoAvancar}                 xpath=//*[@id="idSIButton9"]
${InputSenha}                   xpath=//*[@id="i0118"]
${AbaItens}                     xpath=//button[contains(@label,'Itens')]

*** Keywords ***
Dado que eu esteja na URL https://sidp.fitec.org.br/login
    Acessar URL
    Maximize Browser Window

Quando eu clicar no botão Fazer login com microsoft
    Click Button    ${BotaoLoginMicrosoft}

E digitar o email
    Wait Until Element Is Visible    ${InputEmail}
    Input Text    ${InputEmail}    fitec@dpr.com.br

E clicar em avançar
    Click Element    ${BotaoAvancar}

E digitar a senha
    Wait Until Element Is Visible    ${InputSenha}
    Input Text    ${InputSenha}    Fitec@2023

E clicar em continuar conectado
    Run Keyword    E clicar em avançar

Então devera ser apresentado a tela inicial do sistema com a listagem do menu itens
    Sleep    2
    Page Should Contain Button    ${AbaItens}