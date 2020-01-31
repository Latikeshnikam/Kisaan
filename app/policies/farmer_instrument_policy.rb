class FarmerInstrumentPolicy < ApplicationPolicy
  def update?
      farmer.admin?
  end
end
