Initial version:

A bash script to validate password strength with the following requirements:

- Length – minimum of 10 characters.
- Contain both alphabet and number.
- Include both the small and capital case letters.
- Color the output green if it passed the validation and red if it didn’t.
- Return exit code 0 if it passed the validation and exit code 1 if it didn’t.
- If a validation failed send a message explaining why

Current open issues: 
- Make sure your script can run automatically without the need for human intervention
- Write the script in the best possible way (for performance and UX)

Usage example:

./password-validator.sh "MyP@ssw0rd!"
