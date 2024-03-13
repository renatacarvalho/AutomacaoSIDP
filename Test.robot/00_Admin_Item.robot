*** Settings ***
Resource         ../Resources.robot/main.robot
Resource    ../Resources.robot/PageObject.robot/login.robot
Resource    ../Resources.robot/PageObject.robot/guiaItens.robot
Resource    ../Resources.robot/PageObject.robot/detalheItem.robot

*** Test Cases ***
Login
    Dado que eu esteja na URL https://sidp.fitec.org.br/login
    Quando eu clicar no botão Fazer login com microsoft
    E digitar o email
    E clicar em avançar
    E digitar a senha
    E clicar em avançar
    E clicar em continuar conectado
    Então devera ser apresentado a tela inicial do sistema com a listagem do menu itens
Upload de novo documento "teste item" através do item 07355.9172
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E realizar upload atraves do tipo etf
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Encaminhar para o backup aprovação do documento "teste item"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar no botao encaminhar para o backup
    E clicar em encaminhar na mensagem de confirmação
    Então o sistema devera apresentar a mensagem "Backup(s) notificado(s) com sucesso."
Recusa do documento "teste item"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar em recusar 
    E selecionar o motivo da recusa
    E inserir um comentario para recusa do documento
    E clicar no botao recusar  
    Então o sistema devera apresentar a mensagem "Documento recusado"
Upload de novo documento "teste item" através do item 07355.9172 pela segunda vez
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E realizar upload atraves do tipo etf
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Aprovação do documento "teste item"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
Excluir o documento "teste item"
    Quando eu pesquisar pelo documento teste vinculado ao item 07355.9172 no menu documentos
    E clicar no botao buscar
    E clicar em excluir o documento
    E clicar em excluir na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento excluído com sucesso"
Associação do documento "teste item 02" via SIDP
    Dado que eu esteja no menu item
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar no botão vincular documentos
    E clicar no botao via SIDP
    E pesquisar o código 07353.0172
    E selecionar o documento item teste 2
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Aprovação do documento "teste item 02"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
Permitir que o documento teste item 02 seja desvinculado do item 07355.9172
    E der um duplo click no item 07355.9172
    E clicar nos tres pontinhos da coluna ações do documento teste item 02
    E clicar em desvincular documento
    E clicar em desvincular na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento desvinculado com sucesso"
Não permitir que o documento "Não desvincular item" seja desvinculado pois so tem um vinculo através do item 07355.9172
    E clicar nos tres pontinhos da coluna ações do documento Não desvincular item
    E clicar em desvincular documento
    E clicar em desvincular na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento não desvinculado. Necessário ao menos um vinculo por documento."
Solicitar revisão do documento "Não desvincular item" - Texto sem aspas
    E clicar no documento Não desvincular item
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto sem caracteres aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."  
Cancelar solicitação de revisão de um documento do item 07355.9172 atraves do resumo lateral da tela de detalhes
    E clicar no documento Não desvincular item
    E clicar no botão Solicitar Revisão
    E clicar no botão cancelar
    Então devo retornar para a tela de detalhes do item 07355.9172
Solicitar revisão do documento "Não desvincular item" - Texto com aspas
    E clicar no documento Não desvincular item
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto com aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."
Aprovar solicitação de revisão do documento "Não desvincular item" 
    E clicar no documento Não desvincular item
    E clicar no botão Analisar Solicitações
    E clicar em aprovar solicitação
    Então o sistema deverá apresentar a mensagem "Solicitação respondida com sucesso"
Solicitar revisão do documento "Não desvincular item" - Texto com aspas - segunda vez
    E clicar no botão fechar
    E clicar no documento Não desvincular item
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto com aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."
Recusar solicitação de revisão do documento "Não desvincular item"
    E clicar no botão Analisar Solicitações
    E clicar em reprovar solicitação
    E inserir o motivo da recusa
    E clicar no botão recusar solicitação
    Então o sistema deverá apresentar a mensagem "Solicitação respondida com sucesso"
    E clicar no botão fechar
Download original do documento Não desvincular item
    E clicar nos tres pontinhos da coluna ações do documento Não desvincular item
    E clicar na opção Documento Original
    Então o download do documento Não desvincular item deverá ser realizar no desktop na versão docx
Download pdf do documento Não desvincular item
    E clicar nos tres pontinhos da coluna ações do documento Não desvincular item
    E clicar na opção Documento pdf
    Então o download do documento Não desvincular item deverá ser realizar no desktop na versão pdf
Enviar nova versão do documento "revisão item" para aprovação
    E clicar no documento revisão item
    E clicar no botão Enviar Revisão
    E realizar upload do documento revisão item para revisão
    E clicar no botao vincular
    Então o sistema deverá apresentar a mensagem "Documento enviado para revisão"    
Aprovar nova versão do documento "revisão item"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
Excluir versão aprovada do documento "revisão item"
    Quando eu clicar no menu documentos
    E pesquisar pelo documento revisão item
    E clicar no botao buscar
    E clicar em excluir o documento
    E clicar em excluir na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento excluído com sucesso"
Upload do documento "revisão item" após ter sido aprovado nova versão e excluido  
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E realizar upload atraves do tipo ocd
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Aprovar documento "revisão item"
    Quando eu clicar na aba item
    E pesquisar pelo item 07355.9172
    E clicar em buscar
    E clicar no item 07355.9172
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."