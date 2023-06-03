class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    super
  end
end
