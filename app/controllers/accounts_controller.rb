class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params.require(:account).permit(:account_name, :account_balance))
    @account.customer_id = current_user.id
    if @account.save
      flash[:notice] = "Account created successfully"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to root_path
    end
  end

end
