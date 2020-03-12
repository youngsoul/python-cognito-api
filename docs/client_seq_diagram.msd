#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
# This is a comment.

title "Securing AWS API Gateway with Cognito"

participant "Python Client" as PC
participant "AWS API Gateway" as API
participant "AWS Cognito" as COG
participant "AWS Lambda" as LAM

activate PC

PC->COG: 1. SignUp User (sign_up)
*-->PC: 2. Email with Confirmation Code
PC->COG: 3. Confirm with code (confirm_sign_up)

note over COG
"""
Only needs to be done once
"""
end note

PC->COG: 4. Login (initiate_auth)
COG->PC: 4.5 Returns token
loop [Multiple Requests]
	PC->API: 5. HTTP Request with token
	API->COG: 6. Verify token
	COG->API: 7. Verification status
	API->LAM: 8. Call Lambda
	LAM->PC: 9. Response with Lambda results





