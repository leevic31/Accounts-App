class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end

    def show
        @transaction = Transaction.find(params[:id])
        @bank = Bank.find(Transaction.find(params[:id]).bank_id)
    end

    def new
        @transaction = Transaction.new
      end
    
      def create
        @account = Account.find(params[:account_id])
        @transaction = @account.transactions.create(transaction_params)
        redirect_to account_path(@account)
      end

      def edit
        @transaction = Transaction.find(params[:id])
      end
    
      def update
        @transaction = Transaction.find(params[:id])
    
        if @transaction.update(transaction_params)
          redirect_to @transaction
        else
          render :edit
        end
      end

      def destroy
        @transaction = Transaction.find(params[:id])
        @account = @transaction.account_id
        @transaction.destroy
        redirect_to account_path(@account)
      end

      private
        def transaction_params
          params.require(:transaction).permit(:amount, :date, :description, :bank_id)
        end
end
