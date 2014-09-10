class Admin::BugClassesController < ApplicationController
  before_action :ensure_admin
  before_action :find_bug_class, only: [:edit, :update, :destroy]

  def index
    @bcs = BugClass.all
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
    if @bc.destroy
      alert_js('SUCCESS word deleted.')
    else
      alert_js('!!!ERROR deleting word!!!')
    end
  end

  private
  def find_bug_class
    @bc = BugClass.find(params[:id])
  end

end