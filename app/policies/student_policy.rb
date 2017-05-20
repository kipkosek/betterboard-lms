class StudentPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.is_a? Instructor
        scope.all
      elsif user.is_a? Student
        scope.none
      end
    end
  end

  def index?
    user.is_a? Instructor
  end

  # def show?
  #   user.id == record.id
  # end
end
