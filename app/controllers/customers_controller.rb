class CustomersController < ApplicationController

  before_action :require_user
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(params.require(:customer).permit(:first_name, :last_name, :email, :password))
      flash[:notice] = "Customer details updated successfully"
      redirect_to customer_path(@customer)
    else
      flash.now[:notice] = "There were problem/s updating the customer details:"
      render 'edit'
    end
  end

private

def set_customer
  @customer = Customer.find(params[:id])
end

end
