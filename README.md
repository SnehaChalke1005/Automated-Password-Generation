# Automated-Password-Generation

#DESCRIPTION
1- Creates new user accounts on a Linux system.

2- Automatically generates a strong random password for each new user.

3- Assigns that password to the account right away.


#FEATURES
1- Root Privilege Check  
Ensures the script is run with administrative rights before creating accounts.

2- Argument Validation  
Requires a username and allows an optional comment (e.g., full name or purpose).

3- Special Character Inclusion  
Adds a random special character (#$%^&*()) to strengthen password complexity.

4- Error Handling  
Provides clear messages if account creation or password assignment fails.

5- Output Display  
Shows the created username, generated password, and the latest entry in /etc/passwd. 

