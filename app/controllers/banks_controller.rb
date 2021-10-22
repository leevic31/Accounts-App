class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def show
    @banks = Bank.find(params[:id])
  end

  def new
    @banks = Bank.new
  end

  def create
    @banks = Bank.new(bank_params)

    if @banks.save
      redirect_to @banks
    else
      render :new
    end
  end

  def edit
    @banks = Bank.find(params[:id])
  end


  def update
    @banks = Bank.find(params[:id])

    if @banks.update(bank_params)
      redirect_to @banks
    else
      render :edit
    end
  end


  def destroy
    @banks = Bank.find(params[:id])
    @banks.destroy

    redirect_to banks_path
  end

  private
  def bank_params
    params.require(:bank).permit(:name)
  end
end
