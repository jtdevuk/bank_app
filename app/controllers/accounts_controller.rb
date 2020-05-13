class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params.require(:account).permit(:account_name, :account_balance))
    @account.customer_id = current_user.id

    if current_user.accounts.count >= 2
      flash[:notice] = "Customers can only have two accounts"
      redirect_to current_user and return
    end

    if @account.save
      flash[:notice] = "Account created successfully"
      redirect_to current_user
    else    
      render 'new'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to current_user
  end

end
