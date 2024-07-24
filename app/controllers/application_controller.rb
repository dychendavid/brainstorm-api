class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authorize_request

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header

    begin
      @decoded = JsonWebToken.decode(header)
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      render json: { errors: "Unauthorized" }, status: :unauthorized
    end
  end
end
