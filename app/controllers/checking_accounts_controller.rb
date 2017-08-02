class CheckingAccountsController < ApplicationController

  def new

  end

  def index
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
        account.bankaccount_id = rand(100..999)
        @temp = account.bankaccount_id
        account.bankaccount_number = "012345678910" + rand(1000..9999).to_s
        account.balance = 500
        account.save

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
