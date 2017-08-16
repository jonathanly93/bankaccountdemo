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
      else
          redirect_to "/maroonpay_2", alert: "You must transfer at least one dollar!!"
      end
    end
  end

  def transfer
  end

  def new
  end

  def index
  end

  def show
  end

  def show2
  end

end
