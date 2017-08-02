class BanksController < ApplicationController

  def index
  
  end

  def show
    @bank = Bank.find_by(id: params["id"])
    @reviews = Review.where(bank_id: @bank.id)
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new
    @bank.title = params["title"]
    @bank.price = params["price"].to_f * 100
    @bank.description = params["description"]
    @bank.photo_url = params["photo_url"]
    if @bank.save
      redirect_to "/banks", notice: 'Bank successfully created.'
    else
      render "new"
    end
  end

  def edit
    @bank = Bank.find_by(id: params["id"])
  end

  def update
    @bank = Bank.find_by(id: params["id"])
    @bank.title = params["title"]
    @bank.price = params["price"].to_f * 100
    @bank.description = params["description"]
    @bank.photo_url = params["photo_url"]
    if @bank.save
      redirect_to "/banks/#{@bank.id}", notice: 'Bank successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    bank = Bank.find_by(id: params["id"])
    bank.delete
    redirect_to "/banks",  notice: 'Bank toasted!'
  end
end
