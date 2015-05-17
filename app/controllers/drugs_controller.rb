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
      render :show_preview
    else
      alert_js('ERROR: No such drug...')
    end
  end

  def refresh_preview
    @drug = Drug.find(params[:id])
    if @drug
      @id = params[:id]
      render :refresh_preview
    else
      alert_js('ERROR: No such drug...')
    end
  end

end