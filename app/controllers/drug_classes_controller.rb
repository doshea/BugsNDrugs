class DrugClassesController < ApplicationController

  def show
    @bc = DrugClass.find(params[:id])
    child = @bc
    @lineage = []
    while child.drug_class
      @lineage = [child.drug_class] + @lineage
      child = child.drug_class
    end
  end

end