# mpcs52553-final


### Checklist
Reasonably complete model validation- 
I included email validation during the registrations to make sure every email login is unique. I will be including more validation for
specific saving /checking account in the future. Currently they are half way done

At least one completely RESTful resource-
Most of my routes are completed. I still need to work on the checking/saving accounts

Users can sign up, login, and logout-
This feature is currently working

### How to test
1) You might need to do a db:seed and db:migrate and db:seed to repopulate the data. There may still be extra dummy date left over
2) Sign up a new user at the top right of the root.
3) Create a new user name by filling out the form completely. Alert messages shoould pop up if you do not fill them correctly
4) You will be redirected to the root shortly. You can now log in with your new user.
5) Logging in with the user will allow you access to two more tabs. Currently transaction is a work in progress and does not list anything.
6) You can create a new checking account. The saving account is still a work in progress as I decide how to distinguish them in my project.
7) The saving account will be automatically generated once you follow the instructions provided. Currently this is just for show and I will add in more features shortly.
8) Pages such as checking, saving, maroonpay are currently allowing users who are not logged in to go to these pages. I will fix this before turning in my final. Only users who are logged in should be able to see these pages.
9) Log out when you are complete!


### Work in Progress
1) Transactions update
2) Viewing priveledges for account log in
3) Difference between Checking and Savings account
4) Money Transfer (MaroonPay)

