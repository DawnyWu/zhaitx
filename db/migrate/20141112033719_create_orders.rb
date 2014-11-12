class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :address, index: true
      t.string :remark
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
