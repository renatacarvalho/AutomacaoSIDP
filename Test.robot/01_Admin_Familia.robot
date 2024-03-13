*** Settings ***
Resource         ../Resources.robot/main.robot
Resource    ../Resources.robot/PageObject.robot/login.robot
Resource    ../Resources.robot/PageObject.robot/guiaFamilias.robot
Resource    ../Resources.robot/PageObject.robot/detalheFamilia.robot
Resource    ../Resources.robot/PageObject.robot/guiaDocumentos.robot

*** Test Cases ***
Upload do documento teste familia via desktop através da familia ABRASIVO - MISC - PROD INTERNA
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E clicar no campo tipo de documento
    E selecionar tipo de documento
    E clicar no botao de upload
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Encaminhar documento "teste familia" para aprovação do backup 
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar no botao encaminhar para o backup
    E clicar em encaminhar na mensagem de confirmação
    Então o sistema devera apresentar a mensagem "Backup(s) notificado(s) com sucesso."
Aprovar documento "teste familia"
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
Excluir documento "teste familia"
    Quando eu clicar no menu documentos
    E pesquisar pelo documento teste automacao
    E clicar no botao buscar
    E clicar em excluir o documento
    E clicar em excluir na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento excluído com sucesso"
Upload do documento "teste familia" pela segunda vez através da familia ABRASIVO - MISC - PROD INTERNA
    Dado que eu esteja no menu item
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E clicar no campo tipo de documento
    E selecionar tipo de documento
    E clicar no botao de upload
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Recusa do documento "teste familia"
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar em recusar 
    E selecionar o motivo da recusa
    E inserir um comentario
    E clicar no botao recusar  
    Então o sistema devera apresentar a mensagem "Documento recusado" 
Associação do documento "teste 01" via SIDP através da familia ABRASIVO - MISC - PROD INTERNA
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar no botão vincular documentos
    E clicar no botao via SIDP
    E inserir a familia ABRAP no campo de busca
    E clicar na familia ABRAP 
    E selecionar o primeiro documento
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Aprovar documento "Teste 01"
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."
Permitir que o documento teste 01 seja desvinculado da familia ABRASIVO - MISC - PROD INTERNA
    Quando eu clicar na aba familias
    E der um duplo clique na famila ABRASIVO - MISC - PROD INTERNA
    E clicar nos tres pontinhos da coluna ações do documento teste 01
    E clicar em desvincular documento
    E clicar em desvincular na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento desvinculado com sucesso"
Não permitir que o documento Não desvincular seja desvinculado pois so tem um vinculo através da familia ABRASIVO - MISC - PROD INTERNA
    E clicar nos tres pontinhos da coluna ações do documento nao desvincular
    E clicar em desvincular documento
    E clicar em desvincular na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento não desvinculado. Necessário ao menos um vinculo por documento."
Solicitar revisão do documento "revisão familia" - Texto sem aspas
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto sem caracteres aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."  
Cancelar Solicitação do documento "revisão familia"
    E clicar no botão Solicitar Revisão
    E clicar no botão cancelar
    Então devo retornar para a tela de detalhes da familia com o documento não desvincular visivel
Solicitar revisão do documento "revisão familia" - Texto com aspas
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto com aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."
Aprovar solicitação de revisão do documento "revisão familia"
    E clicar no botão Analisar Solicitações
    E clicar em aprovar solicitação
    Então o sistema deverá apresentar a mensagem "Solicitação respondida com sucesso"
Solicitar revisão do documento "revisão familia" - Texto sem aspas - segunda vez
    E clicar no botão fechar
    E clicar no botão Solicitar Revisão
    E informar o motivo da solicitação texto sem caracteres aspas
    E clicar em solicitar revisão após inserção do motivo da solicitação
    Então o sistema deverá apresentar a mensagem "A solicitação foi realizada com sucesso."  
Recusar solicitação de revisão do documento "revisão familia" - Texto sem aspas
    E clicar no botão Analisar Solicitações
    E clicar em reprovar solicitação
    E inserir o motivo da recusa
    E clicar no botão recusar solicitação
    Então o sistema deverá apresentar a mensagem "Solicitação respondida com sucesso"
    E clicar no botão fechar
Download original do documento Não desvincular
    E clicar nos tres pontinhos da coluna ações do documento nao desvincular
    E clicar na opção Documento Original
    Então o download do documento deverá ser realizar no desktop na versão docx
Download pdf do documento Não desvincular
    E clicar nos tres pontinhos da coluna ações do documento nao desvincular
    E clicar na opção Documento pdf
    Então o download do documento deverá ser realizar no desktop na versão pdf
Enviar nova versão do documento "revisão familia" 
   E clicar no documento revisão familia 
   E clicar no botão Enviar Revisão
   E realizar upload do documento revisão familia para revisão 
   E clicar em vincular nova versão de documento
   Então o sistema deverá apresentar a mensagem "Documento enviado para revisão"
Aprovar nova versão do documento "revisão familia" 
    Quando eu retornar para a aba de familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso."   
Excluir versão aprovada do documento "revisão familia"
    Quando eu clicar no menu documentos
    E pesquisar pelo documento revisão - automação
    E clicar no botao buscar
    E clicar em excluir o documento
    E clicar em excluir na mensagem de confirmação
    Então o sistema deverá apresentar a mensagem "Documento excluído com sucesso"
Upload do documento "revisão familia" após ter sido aprovado nova versão e excluido   
    Dado que eu esteja no menu item
    Quando eu clicar na aba familias
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar no botão vincular documentos
    E clicar no botao busque no desktop
    E clicar no campo tipo de documento
    E selecionar tipo de documento DT
    E carregar o documento revisão familia
    E clicar no botao vincular
    Então o sistema devera apresentar a mensagem "Documento enviado para análise"
Aprovar documento "revisão familia"
    E clicar na familia ABRASIVO - MISC - PROD INTERNA
    E clicar em analisar pendencia
    E clicar em aprovar
    Então o sistema devera apresentar a mensagem "O documento foi aprovado com sucesso." 


    





    

