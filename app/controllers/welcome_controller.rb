class WelcomeController < ApplicationController
  skip_before_action :authorize_request
end
