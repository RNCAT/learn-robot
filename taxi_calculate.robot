*** Settings ***
Library          SeleniumLibrary
Library          Builtin
Test Teardown    Close All Browsers

*** Variables ***
${URL}        https://nhaidee.com/travel/%E0%B8%84%E0%B9%8D%E0%B8%B2%E0%B8%99%E0%B8%A7%E0%B8%93%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B9%81%E0%B8%97%E0%B9%87%E0%B8%81%E0%B8%8B%E0%B8%B5%E0%B9%88/
${BROWSER}    Chrome

*** Keywords ***
TAXI Cal
    [Arguments]                          ${distance}            ${traffic}     ${price}
    Open Browser                         ${URL}                 ${BROWSER}
    Input Text                           name=distance          ${distance}
    Input Text                           name=traffic           ${traffic}
    Submit Form                          id=c1
    Element Attribute Value Should Be    id=calculated_Price    value          ${price}
    Close Browser

*** Test Cases ***
Taxi1
    TAXI Cal    1    0    35.00

Taxi2
    TAXI Cal    5    0    57.00

Taxi3
    TAXI Cal    15    0    117.00

Taxi4
    TAXI Cal    25    0    187.00

Taxi5
    TAXI Cal    45    0    341.00

Taxi6
    TAXI Cal    70    0    551.00

Taxi7
    TAXI Cal    100    0    851.00

Taxi8
    TAXI Cal    10    10    105.00

Taxi9
    TAXI Cal    0    0    0.00

Taxi10
    TAXI Cal    -10    0    0.00
