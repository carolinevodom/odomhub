require 'pry'
class ApplicationController < ActionController::Base
  include ::ActionView::Layouts

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout 'application'
  #This puts the layout file in app/views/layouts/application.html.erb on each page
  def hello
  end
end
