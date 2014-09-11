class Admin::BugsController < ApplicationController
  before_action :ensure_admin
  before_action :find_bug, only: [:edit, :update, :destroy]

  def index
    @new_bug = Bug.new
    @bugs = Bug.all
  end

  def create
    @new_bug = Bug.new
    @bug = Bug.create(admin_params)
  end

  def edit
  end

  def update
    if @bug.update_attributes(admin_params)
      alert_js('SUCCESS bug updated.')
    else
      alert_js('!!!ERROR updating bug!!!')
    end
  end

  def destroy
    @bug.destroy
  end

  private
  def find_bug
    @bug = Bug.find(params[:id])
  end

  def admin_params
    params.require(:bug).permit(:name, :common_name, :gram_stain, :environment, :morphology, :growth_pattern, :description, :brief_description, :toxins, :order, :bug_class_id)
  end

end