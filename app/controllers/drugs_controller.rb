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

  def show_preview
    @drug = Drug.find(params[:id])
    if @drug
      @id = params[:id]
      @treats = nil #FIX THIS
      @administered = @drug.administered
      @metabolized_in = @drug.metabolized_in
      @mechanism = @drug.mechanism || 'Unknown'
      # @side_effects = ['Death','Vomiting','Myelosuppression']
      @side_effects = @drug.tox_to_a
      render :show_preview
    else
      alert_js('ERROR: No such drug...')
    end
  end

end