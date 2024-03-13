*** Settings ***
Resource    ../main.robot

*** Variables ***
${DOWNLOAD_DIRECTORY}    C:\\Download
&{geral}
...    URL=https://sidp.fitec.org.br/login
...    Browser=chrome