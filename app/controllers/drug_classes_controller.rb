class DrugClassesController < ApplicationController

  def show
    @dc = DrugClass.find(params[:id])
    child = @dc
    @lineage = []
    while child.drug_class
      @lineage = [child.drug_class] + @lineage
      child = child.drug_class
    end
  end

end