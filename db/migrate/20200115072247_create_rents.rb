class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
    	t.references :farmer_instrument
    	t.references :farmer
		t.date :from
    	t.date :to
      t.timestamps
    end
  end
end
