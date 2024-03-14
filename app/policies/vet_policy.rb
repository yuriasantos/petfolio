class VetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    create?
  end

  def create?
    user.clinic?
  end

  def show?
    user.related_object == record
  end
end
