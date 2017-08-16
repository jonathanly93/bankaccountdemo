class CheckingAccountsController < ApplicationController

  def new

  end

  def index
  end

  def delete
    user = User.find_by(user_id: params["user_id"])
    account = BankAccount.find_by(bankaccount_number: params['account'])
    main_account = BankAccount.find_by(bankaccount_number: user.main_account_id)

    if account == nil
      redirect_to "/users/#{user.id}", alert: "You need to select an account to delete!"
    else
      if user.main_account_id == account.bankaccount_number
      redirect_to "/users/#{user.id}", alert: "You cannot delete your main account"
      else
      main_account.balance = main_account.balance + account.balance
      main_account.save
      account.delete
      redirect_to "/users/#{user.id}", notice: "Account delete. The remaining balance has been transfered to your main account"
      end
    end
  end

  def create
    u = User.find_by(email: params["email"])
    user = User.find_by(id: session["user_id"])

    if u != nil
      if u.authenticate(params["password"])
        cookies["user_id"] = u.id
        session["user_id"] = u.id

        account = BankAccount.new
        account.user_id = session["user_id"]
        account.bankaccount_id = rand(100..999).to_s
        @temp = account.bankaccount_id
        account.bankaccount_number = "012345678910" + rand(1000..9999).to_s
        account.balance = 500
        account.save

        if user.main_account_id == nil
          user.main_account_id = account.bankaccount_number
          user.save
        end
        account = BankAccount.find_by(bankaccount_id: @temp.to_s)
        redirect_to "/users/#{user.id}", notice: "Account Successfully Created!
                                                  \nNew account information is as followed:
                                                  \nAccount ID: #{account.bankaccount_id}
                                                  \nAccount #: #{account.bankaccount_number}
                                                  \nBalance: $#{account.balance}"

      else
        redirect_to "/checking_account/new", alert: "Incorrect Email or Password"
      end
    else
      redirect_to "/checking_account/new", alert: "Incorrect Email or Password"
    end


  end

end
