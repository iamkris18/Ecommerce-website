class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[ new edit update destroy ]

  def index
  end
  def products
  end
end
