class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
    	t.string :name
    	t.string :brand
    	t.text :specification 

      t.timestamps
     end
     change_table :instruments do |t|
     	t.rename :name, :instrument_name
     end

   end
end

