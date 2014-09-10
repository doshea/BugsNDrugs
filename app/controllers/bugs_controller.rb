class BugsController < ApplicationController

  def index
  end

  def show
    @bug = Bug.find(params[:id])
    child = @bug
    @lineage = []
    while child.drug_class && child.drug_class.drug_class
      @lineage = [child.drug_class] + @lineage
      child = child.drug_class
    end
  end

end