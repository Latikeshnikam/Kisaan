class ApplicationPolicy
  attr_reader :farmer, :record

  def initialize(farmer, record)
    @farmer = farmer
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :farmer, :scope

    def initialize(farmer, scope)
      @farmer = farmer
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
