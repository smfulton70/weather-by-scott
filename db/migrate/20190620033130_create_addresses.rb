class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_and_number
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
