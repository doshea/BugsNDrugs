class BugClassesController < ApplicationController

  def index
  end

  def show
    @bc = BugClass.find(params[:id])
  end

end