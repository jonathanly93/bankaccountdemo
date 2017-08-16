# mpcs52553-final


### Features
1) Ability to sign up for a unique account base on your email. There are no restrictions for what the email can be.
2) You can create as many checking account withing your account.
3) Creating an account will automatically deposit $500.
4) Creating your first account will automatically assign that account as your main checking account.
5) You can change your main checking account in the account tab.
6) You can close any account besides your main account. Closing accounts will move all the balance from that account into the main account.
7) You can transfer money between your accounts and to other users by providing their email.
8) The money transfered to other users will automatically deposit into their main account.
9) You can withdraw and deposit money into your account. You cannot withdraw more than you have.
10) There should be login confidentiality meaning most of the pages will redirect you to the log in page if you are not currently logged in.

### How to test
1) You might need to do a db:seed and db:migrate and db:seed to repopulate the data. There may still be extra dummy date left over
2) Sign up two accounts from the sign up page. This is to test the transfer money function.
3) Login to one account in your web browser and another in a second web browser/icognito mode. This will help you see the money transfer faster.
4) Create at least two checking account for each account.
5) You can now go to MaroonPay and test out depositing and withdrawing money.
6) Test out transfering money inbetween accounts.
7) Test out transfering money inbetween two users. You will need to provide the email for the other user.
8) To delete accounts, go to the account tab and find the section with delete.
9) You can view transaction history on the top toolbar



### Notes From last time
1) I included everything I planned on including since the first update besides saving account.
2) I figured having this feature is irrelevant because this is a simulator. There does not seem to be a point in accumulating money when the simulation shows money being transfered in a fast rate

