module PeopleHelper
  def active?(department, scope)
    'selected' if department.downcase == scope
  end

  def all_active?(scope)
    'selected' if scope.nil?
  end
end
