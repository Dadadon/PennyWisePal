class CreateJoinTablePaymentsCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :payments, :categories do |t|
      # t.index [:payment_id, :category_id]
      # t.index [:category_id, :payment_id]
    end
  end
end
