*** Settings ***
Resource         ../Resources.robot/main.robot
Resource    ../Resources.robot/PageObject.robot/login.robot

*** Test Cases ***
Filtro pelo titulo Documento excluido do sistema
    Dado que eu clique no menu notificações
    Quando eu clicar em ver tudo
    E pesquisar por Documento excluido do sistema no campo de busca
    E clicar em buscar
    Então deverá existir notificação com o titulo "Documento excluido do sistema"
Filtro pelo titulo Documento aprovado
    Dado que eu clique no menu notificações
    Quando eu clicar em ver tudo
    E pesquisar por Documento aprovado do sistema no campo de busca
    E clicar em buscar
    Então deverá existir notificação com o titulo "Documento aprovado"
Filtro pelo titulo Documento adicionado ao sistema
    Dado que eu clique no menu notificações
    Quando eu clicar em ver tudo
    E pesquisar por Documento adicionado do sistema no campo de busca
    E clicar em buscar
    Então deverá existir notificação com o titulo "Documento adicionado ao sistema"
    