*** Settings ***
Library         Selenium2Library
Library         LambdaTestStatus.py
Library         BuiltIn
Library         DebugLibrary

*** Variables ***
${LT_USERNAME}=         baoshenyi
${LT_ACCESS_KEY}=       4ErofDT8Nry0d6HiLy2MnypHvBP1MmA8ZJaZ3zqRNBhyYipmAh
${BROWSER}          ${ROBOT_BROWSER}
&{options}          browserName=${browserName}     platform=${platform}       version=${version}        visual=${visual}       network=${network}        console=${console}      name=RobotFramework Lambda Test
&{CAPABILITIES}     LT:Options=&{options}
${REMOTE_URL}       https://${LT_USERNAME}:${LT_ACCESS_KEY}@hub.lambdatest.com/wd/hub
${CAPABILITIES}=    Set Suite Variable  ${CAPABILITIES}
${REMOTE_URL}=      Set Suite Variable  ${REMOTE_URL}
${TIMEOUT}          3000

*** Keywords ***

Open test browser
    [Timeout]   ${TIMEOUT}
    #   Debug
    Open browser  https://lambdatest.github.io/sample-todo-app/  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    Close all browsers