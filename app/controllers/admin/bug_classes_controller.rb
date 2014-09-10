class Admin::BugClassesController < ApplicationController
  before_action :ensure_admin
  before_action :find_bug_class, only: [:edit, :update, :destroy]

  def index
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def find_bug_class
    @clue = Clue.find(params[:id])
  end

end