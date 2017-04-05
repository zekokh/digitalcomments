class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  $connect = Insta.new

end
