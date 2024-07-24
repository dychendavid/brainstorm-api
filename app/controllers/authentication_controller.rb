class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  def guest_authorize
    expired_at = 24.hours.from_now
    @token = JsonWebToken.encode({ token_type: AuthorizationLog.token_types[:guest], exp: expired_at }, expired_at)
    AuthorizationLog.create!(ip: request.remote_ip, token_type: AuthorizationLog.token_types[:guest],
                             expired_at: expired_at, token: @token)
    render json: { token: @token }, status: :ok
  end
end
