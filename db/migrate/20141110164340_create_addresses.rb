class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :university
      t.string :campus
      t.string :location
      t.string :user_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
