class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to @bank
    else
      render :new
    end
  end

  def edit
    @bank = Bank.find(params[:id])
  end


  def update
    @bank = Bank.find(params[:id])

    if @bank.update(bank_params)
      redirect_to @bank
    else
      render :edit
    end
  end


  def destroy
    @bank = Bank.find(params[:id])
    @bank.destroy

    redirect_to banks_path
  end

  private
  def bank_params
    params.require(:bank).permit(:name)
  end
end
