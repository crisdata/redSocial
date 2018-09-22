class ApplicationController < ActionController::Base
  layout :set_layout

  protected
  def set_layout
    'application'
  end
end
