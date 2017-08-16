class TransactionController < ApplicationController

  def index
    if session["user_id"] == nil
      redirect_to "/sessions/new", alert: "Please log in to your account!"
    end
  end

  def create
    transaction = Transaction.new
    transaction.bankaccount_number = params['account']
    transaction.action = "Deposit"
    transaction.transfer = params['amount'].to_i

    if transaction.bankaccount_number == nil
      redirect_to "/maroonpay/payment", alert: "You must select a bank account"
    else
      if transaction.transfer > 0
        account = BankAccount.find_by(bankaccount_number: params['account'])
        account.balance = account.balance + params['amount'].to_i
        account.save
        transaction.save
        redirect_to "/maroonpay/payment", notice: "The transaction has been completed!"

      else
        redirect_to "/maroonpay/payment", alert: "You must deposit at least one dollar!!"
      end
    end
  end

  def move
    transaction = Transaction.new
    transaction.bankaccount_number = params['account']
    transaction.action = "Moved"
    transaction.transfer = params['amount'].to_i

    if transaction.bankaccount_number == nil
      redirect_to "/maroonpay", alert: "You must select a bank account"
    else
      if transaction.transfer > 0
        account = BankAccount.find_by(bankaccount_number: params['account'])
        account2 = BankAccount.find_by(bankaccount_number: params['account2'])
        if transaction.transfer > account.balance
            redirect_to "/maroonpay/", alert: "You cannot withdraw that amount!"
        else
          account.balance = account.balance - params['amount'].to_i
          account2.balance = account2.balance + params['amount'].to_i
          account.save
          account2.save
          transaction.save
          redirect_to "/maroonpay", notice: "The transaction has been completed!"
        end

      else
        redirect_to "/maroonpay/", alert: "You must deposit at least one dollar!!"
      end
    end
  end

  def withdraw
    transaction = Transaction.new
    transaction.bankaccount_number = params['account']
    transaction.action = "Withdraw"
    transaction.transfer = params['amount'].to_i

    if transaction.bankaccount_number == nil
      redirect_to "/maroonpay/withdraw", alert: "You must select a bank account"
    else
      if transaction.transfer > 0
        account = BankAccount.find_by(bankaccount_number: params['account'])
        if transaction.transfer > account.balance
            redirect_to "/maroonpay/withdraw", alert: "You cannot withdraw that amount!"
        else
          account.balance = account.balance - params['amount'].to_i
          account.save
          transaction.save
          redirect_to "/transactions", notice: "The transaction has been completed!"
        end

      else
        redirect_to "/maroonpay/withdraw", alert: "You must deposit at least one dollar!!"
      end
    end
  end


end
