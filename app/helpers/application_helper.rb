module ApplicationHelper
  def resource
    @resource ||= User.new # asigna lo que tenemos al lado derecho ||=, a la variable del lado izquiendo, cuando esa llegue a ser nula o no exista
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end
end
