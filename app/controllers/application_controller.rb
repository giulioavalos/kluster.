class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def not_found
    render file: "#{Rails.root}/public/404.html", layout: 'application', status: :not_found
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
