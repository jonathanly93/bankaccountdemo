class MaroonpayController < ApplicationController

  def transferout

    transaction = Transaction.new
    transaction.bankaccount_number = params['account']
    transaction.action = "Delivered"
    transaction.transfer = params['amount'].to_i  

    if transaction.bankaccount_number == nil
      redirect_to "/maroonpay_2", alert: "Please select an account"
    else
      if transaction.transfer > 0

        if User.find_by(email: params["email"]) == nil
          redirect_to "/maroonpay_2", alert: "Invalid email"
        else
          user = User.find_by(email: params["email"])
          if user.main_account_id == nil
            redirect_to "/maroonpay_2", alert: "This user does not have a checking account set up!"
          else
            account1 = BankAccount.find_by(bankaccount_number: params["account"])
            account2 = BankAccount.find_by(bankaccount_number: user.main_account_id)

            if account1.balance < params["amount"].to_i
              redirect_to "/maroonpay_2", alert: "Not enough balance to transfer"
            else
              account1.balance = account1.balance - params["amount"].to_i
              account2.balance = account2.balance + params["amount"].to_i
              account1.save
              account2.save
              transaction.save
              redirect_to "/maroonpay_2", notice: "Transaction Complete!"
            end
          end
        end
      else
          redirect_to "/maroonpay_2", alert: "You must transfer at least one dollar!!"
      end
    end
  end

  def transfer
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

  def new
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

  def index
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

  def show
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

  def show2
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

end
