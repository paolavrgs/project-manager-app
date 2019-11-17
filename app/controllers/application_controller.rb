class ApplicationController < ActionController::Base
  def index
    @developers = Developer.all
  end
end
