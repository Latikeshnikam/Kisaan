class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.string :line_1
    	t.string :line_2
    	t.string :city
    	t.integer :pincode
    	t.references :farmer

      t.timestamps
    end
  end
end
