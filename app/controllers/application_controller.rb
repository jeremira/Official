class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def space_on number
    number.to_s.gsub(/\D/, '').reverse.gsub(/.{3}/,'\0 ').reverse
  end

end
