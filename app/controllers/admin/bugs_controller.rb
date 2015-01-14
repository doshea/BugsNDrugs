class Admin::BugsController < ApplicationController
  before_action :ensure_admin
  before_action :find_bug, only: [:edit, :update, :update_array, :destroy]

  def index
    @new_bug = Bug.new
    @bugs = Bug.all.order(:id, :order)
  end

  def create
    @new_bug = Bug.new
    @bug = Bug.create(admin_params)
  end

  def edit
  end

  def update
    if @bug.update_attributes(admin_params)
      console_js("SUCCESS - #{@bug.abbreviated_initial} updated.")
    else
      alert_js("!!!ERROR updating #{@bug.abbreviated_initial}!!!")
    end
  end

  #PATCH /admin/bugs/:id/update_array
  def update_array
    # new_params = array_params.map{|arr| arr.uniq} #ensure unique
    if @bug.update_attributes(array_params)
      console_js("SUCCESS - #{@bug.abbreviated_initial} updated.")
    else
      alert_js("!!!ERROR updating #{@bug.abbreviated_initial}!!!")
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
    params.require(:bug).permit(:name, :common_name, :gram_stain, :environment, :morphology, :growth_pattern, :description, :brief_description, :image, :remote_image_url, :toxins, :order, :bug_class_id, :motile, :encapsulated, :pending, :diseases, :treatments, :tests, :patient_demographics)
  end

  def array_params
    params.require(:bug).permit(diseases: [], treatments: [])
  end

end