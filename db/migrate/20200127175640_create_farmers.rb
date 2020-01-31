class CreateFarmers < ActiveRecord::Migration[5.2]
=begin
  def change
    create_table :farmers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :email
      t.timestamps
    end
  end
=end

  def up
    if (!ActiveRecord::Base.connection.tables.include?("farmers"))
      create_table :farmers do |table|
        t.string :first_name
        t.string :last_name
        t.string :mobile_number
        t.string :email
        t.timestamps

      end
    end
  end


end
