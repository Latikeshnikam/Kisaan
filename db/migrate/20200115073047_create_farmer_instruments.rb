class CreateFarmerInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :farmer_instruments do |t|
    	t.references :farmer
    	t.references :instrument
    	t.integer :rent_per_hour, null: false
    	t.boolean :is_available
    	t.integer :deposit
    	t.date :available_from
    	t.date :available_to

      t.timestamps
    end
  end
end
