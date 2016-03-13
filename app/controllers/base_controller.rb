class BaseController < ApplicationController
  include ActionController::ImplicitRender
  respond_to :json

  before_filter :authenticate_user_from_token!

  protected

  def authenticate_user_from_token!
    puts claims.to_yaml
    if claims and user = User.find_by(email: claims['user'])
      @current_user = user
    else
      return render_unauthorized
    end
  end

  def claims
    puts request.headers['Authorization']
    auth_header = request.headers['Authorization'] and
      token = auth_header.split(' ').last and
      ::JsonWebToken.decode(token)
  rescue
    nil
  end

  def jwt_token user
    JsonWebToken.encode('user' => user.email)
  end

  def render_unauthorized(payload = { errors: { unauthorized: ["You are not authorized perform this action."] } })
    render json: payload.merge(response: { code: 401 })
  end

end
