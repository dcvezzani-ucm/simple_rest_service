class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie

  def set_csrf_cookie
    if protect_against_forgery?
      cookies['XSRF-TOKEN'] = form_authenticity_token
    end
  end

  protected

  def verified_request?
    #super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    super || form_authenticity_token == cookies['XSRF-TOKEN']
  end
end
