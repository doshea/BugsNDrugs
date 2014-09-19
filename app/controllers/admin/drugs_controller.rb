class Admin::DrugsController < ApplicationController
  before_action :ensure_admin
  before_action :find_drug, only: [:edit, :update, :destroy]

  def index
    @new_drug = Drug.new
    @drugs = Drug.all
  end

  def create
    @new_drug = Drug.new
    @drug = Drug.create(admin_params)
  end

  def edit
  end

  def update
    if @drug.update_attributes(admin_params)
      alert_js('SUCCESS drug updated.')
    else
      alert_js('!!!ERROR updating drug!!!')
    end
  end

  def destroy
    @drug.destroy
  end

  private
  def find_drug
    @drug = Drug.find(params[:id])
  end

  def admin_params
    params.require(:drug).permit(:name, :common_name, :gram_stain, :environment, :morphology, :growth_pattern, :description, :brief_description, :toxins, :order, :bug_class_id)
  end

end