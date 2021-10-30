class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @accounts = Account.find(params[:id])
  end

  def new
    @accounts = Account.new
  end

  def create
    @accounts = Account.new(account_params)

    if @accounts.save
      redirect_to @accounts
    else
      render :new
    end
  end

  def edit
    @accounts = Account.find(params[:id])
  end


  def update
    @accounts = Account.find(params[:id])

    if @accounts.update(account_params)
      redirect_to @accounts
    else
      render :edit
    end
  end

  def destroy
    @accounts = Account.find(params[:id])
    @accounts.destroy

    redirect_to accounts_path
  end

  def total
    @accounts = Account.find(params[:id])
  end

  def flag
    @accounts = Account.find(params[:id])
    transaction_list =  @accounts.transactions.order("amount, created_at, description")
    transaction_list_size = @accounts.transactions.size
    @duplicates = Set.new
    
    transaction_list.each_with_index do |t, i|
      if i < transaction_list_size - 1
        if (t.description == transaction_list[i+1].description) && 
              (t.amount == transaction_list[i+1].amount) &&
              ((t.created_at - transaction_list[i+1].created_at) < 60)
          @duplicates << t
          @duplicates << transaction_list[i+1]
        end
      end
    end
  end

  private
  def account_params
    params.require(:account).permit(:name)
  end
end
