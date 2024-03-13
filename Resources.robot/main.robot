*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    

Resource    PageObject.robot/detalheFamilia.robot
Resource    PageObject.robot/detalheItem.robot
Resource    PageObject.robot/guiaDocumentos.robot
Resource    PageObject.robot/guiaFamilias.robot
Resource    PageObject.robot/guiaItens.robot
Resource    PageObject.robot/login.robot
Resource    PageObject.robot/guiaNotificacoes.robot
Resource    Data/geral.robot
Resource    Shared/setup_teardown.robot