class ChangeAttributeConstraintsOfRentPerHourOfFarmerInstrumentTable < ActiveRecord::Migration[5.2]
  def up
    change_column_null :farmer_instruments, :rent_per_hour, true
  end

  def down
    change_column_null :farmer_instruments, :rent_per_hour, false
  end
end
