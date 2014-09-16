class DrugsController < ApplicationController

  def index
  end

  def show
    @drug = Drug.find(params[:id])
    child = @drug
    @lineage = []
    while child.drug_class
      @lineage = [child.drug_class] + @lineage
      child = child.drug_class
    end
  end

end