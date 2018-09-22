class MainController < ApplicationController
  def home; end

  def unregistered; end

  # Este es el hijo que esta sobrescribiendo en el padre
  protected
  def set_layout
    return 'landing' if action_name == 'unregistered'
    super
  end
end
