class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :customer_id
      t.integer :postage
      t.integer :invoice_amount
      t.integer :method_of_payment,default: 0,null: false

      t.string  :post_code
      t.string  :address
      t.string  :name
    end
  end
end
