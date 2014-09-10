class Admin::BugClassesController < ApplicationController
  before_action :ensure_admin
  before_action :find_bug_class, only: [:edit, :update, :destroy]

  def index
    @new_bc = BugClass.new
    @bcs = BugClass.all
  end

  def create
    @new_bc = BugClass.new
    @bc = BugClass.create(admin_params)
  end

  def edit
  end

  def update
    if @bc.update_attributes(admin_params)
      alert_js('SUCCESS bug class updated.')
    else
      alert_js('!!!ERROR updating bug class!!!')
    end
  end

  def destroy
    @bc.destroy
  end

  private
  def find_bug_class
    @bc = BugClass.find(params[:id])
  end

  def admin_params
    params.require(:bug_class).permit(:name, :order, :drug_class_id)
  end

end