class ClinicPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user.clinic? && Clinic.where(user: user).none?
  end

  def show?
    true
  end
end
