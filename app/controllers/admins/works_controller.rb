class Admins::WorksController < ApplicationController
  before_action :authenticate_admin!
  def home
  end
end
