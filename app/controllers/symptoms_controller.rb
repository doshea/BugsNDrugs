class SymptomsController < ApplicationController

  def index
  end

  def show
      @symptom = Symptom.find(params[:id])
      child = @symptom
      @lineage = []
      while child.symptom_class
        @lineage = [child.symptom_class] + @lineage
        child = child.symptom_class
      end
  end

end