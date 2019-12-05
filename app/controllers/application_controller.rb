# Application Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: %i[index]

  def index
    @developers = Developer.all
  end
end
