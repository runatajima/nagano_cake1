class Admin::CustomersController < ApplicationController
  def index
      @cuustomer = Customer.new
      @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end
end

private
  def customer_params
      params.require(:customer).permit(:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:address,:telephone_number,:email,:is_active)
  end