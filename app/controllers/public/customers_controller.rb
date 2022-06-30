class Public::CustomersController < ApplicationController
  def show
    
  end

  def edit
    
  end

  def unsubscrlbe
    
  end
  
  def customers_params
    params.permit(:last_name,:last_name_kana)

  end
end
