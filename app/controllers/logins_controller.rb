class LoginsController < ApplicationController

  def new
  end

  def create
      customer = Customer.find_by(email: params[:login] [:email])
      if customer && customer.authenticate(params[:login] [:password])
        flash[:notice] = "Logged in successfully"
        session[:user_id] = customer.id
        redirect_to customer
      else
        flash.now[:notice] = "There was something wrong with your login details"
        render 'new'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
