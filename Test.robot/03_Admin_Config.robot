*** Settings ***
Resource         ../Resources.robot/main.robot
Resource    ../Resources.robot/PageObject.robot/PageAdmin_TipoDoc.robot

*** Test Cases ***
Criar novo tipo de documento
    Dado que eu clique em configurações no menu
    Quando eu clicar no botão Novo tipo
    E acessar a tela de cadastro de novo tipo de documento
    E preencher o campo sigla
    E preencher o campo nome
    E selecionar um aprovador
    E selecionar um backup
    E preencher o campo descrição
    E clicar em adicionar
    Então deverá ser apresentado uma mensagem de cadastro com sucesso
Filtrar tipo de documento cadastrado
    Quando eu pesquisar pelo tipo de documento cadastrado no campo de filtro
    Então o sistema deverá apresentar o tipo de documento cadastrado - TESTE AUTOMACAO
Editar sigla do tipo de documento cadastrado    
    Quando eu clicar na coluna ações
    E clicar em editar tipo de documento
    E clicar em editar o campo sigla
    E clicar em atualizar
    Então o sistema deverá apreasentar a mensagem "Tipo de documento atualizado com sucesso!"
Excluir tipo de documento cadastrado e editado a sigla
    Quando eu pesquisar pelo tipo de documento com a sigla editada no campo de filtro
    Quando eu clicar na coluna ações
    E clicar em excluir
    Então o documento deverá ser excluido e quando pesquisar por ele nao deverá aparecer na listagem
Criar novo tipo de documento pela segunda vez
    Dado que eu clique em configurações no menu
    Quando eu clicar no botão Novo tipo
    E acessar a tela de cadastro de novo tipo de documento
    E preencher o campo sigla pela segunda vez
    E preencher o campo nome pela segunda vez
    E selecionar um aprovador
    E selecionar um backup
    E preencher o campo descrição
    E clicar em adicionar
    Então deverá ser apresentado uma mensagem de cadastro com sucesso
Filtrar tipo de documento cadastrado pela segunda vez
    Quando eu pesquisar pelo tipo de documento cadastrado no campo de filtro segunda vez
    Então o sistema deverá apresentar o tipo de documento cadastrado - NOVO TIPO
Editar nome do tipo de documento cadastrado    
    Quando eu clicar na coluna ações
    E clicar em editar tipo de documento
    E clicar em editar o campo nome
    E clicar em atualizar
    Então o sistema deverá apreasentar a mensagem "Tipo de documento atualizado com sucesso!"
Excluir tipo de documento cadastrado e editado o nome
    Quando eu pesquisar pelo tipo de documento com o nome editado no campo de filtro
    Quando eu clicar na coluna ações
    E clicar em excluir
    Então o documento deverá ser excluido e quando pesquisar por ele nao deverá aparecer na listagem
