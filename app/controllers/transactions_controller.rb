class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end

    def show
        @transactions = Transaction.find(params[:id])
        @banks = Bank.find(Transaction.find(params[:id]).bank_id)
    end

    def new
        @transactions = Transaction.new
      end
    
      def create
        @accounts = Account.find(params[:account_id])
        @transactions = @accounts.transactions.create(transaction_params)
        redirect_to account_path(@accounts)
      end

      def edit
        @transactions = Transaction.find(params[:id])
      end
    
      def update
        @transactions = Transaction.find(params[:id])
    
        if @transactions.update(transaction_params)
          redirect_to @transactions
        else
          render :edit
        end
      end

      def destroy
        @transactions = Transaction.find(params[:id])
        @accounts = @transactions.account_id
        @transactions.destroy
        redirect_to account_path(@accounts)
      end

      private
        def transaction_params
          params.require(:transaction).permit(:amount, :date, :description, :bank_id)
        end
end
