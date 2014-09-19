class Admin::DrugClassesController < ApplicationController
  before_action :ensure_admin
  before_action :find_drug_class, only: [:edit, :update, :destroy, :add_drug_class]

  def index
    @bcs = DrugClass.all
  end

  def create
    @new_bc = DrugClass.new
    @bc = DrugClass.create(admin_params)
  end

  def edit
  end

  def update
    if @bc.update_attributes(admin_params)
      alert_js('SUCCESS drug class updated.')
    else
      alert_js('!!!ERROR updating drug class!!!')
    end
  end

  def destroy
    @bc.destroy
  end

  def add_drug_class
    @new_bc = @bc.add_child_class(new_drug_class_params[:name])
  end

  def refresh
    @bcs = DrugClass.all
  end

  private
  def find_drug_class
    @bc = DrugClass.find(params[:id])
  end

  def admin_params
    params.require(:drug_class).permit(:name, :order, :drug_class_id)
  end

  def new_drug_class_params
    params.require(:drug_class).permit(:name)
  end

end