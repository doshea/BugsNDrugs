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
      @treats = ['Nothing yet']
      @mechanism = @drug.mechanism || 'Unknown'
      @side_effects = ['Death','Vomiting','Myelosuppression']
      render :show_preview
    else
      alert_js('ERROR: No such drug...')
    end
  end

end