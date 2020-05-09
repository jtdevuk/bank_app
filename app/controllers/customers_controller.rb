class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(params.require(:customer).permit(:first_name, :last_name, :email, :password))
      flash[:notice] = "Customer details updated successfully"
      redirect_to customer_path(@customer)
    else
      flash.now[:notice] = "There were problem/s updating the customer details:"
      render 'edit'
    end
  end

end


# params.require(:person).permit(:name, :age)
