class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def current_page
    params[:page] || 1
  end

  protected

  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
    return
  end
end
