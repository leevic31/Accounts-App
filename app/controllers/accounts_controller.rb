class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end


  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    redirect_to accounts_path
  end

  def total
    @account = Account.find(params[:id])
  end

  def flag
    @account = Account.find(params[:id])
    transaction_list =  @account.transactions.order("amount, created_at, description")
    transaction_list_size = @account.transactions.size
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
