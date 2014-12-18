class BugsController < ApplicationController

  def index
  end

  def show
    @bug = Bug.find(params[:id])
    child = @bug
    @lineage = []
    while child.bug_class
      @lineage = [child.bug_class] + @lineage
      child = child.bug_class
    end
  end

  def show_preview
    @bug = Bug.find(params[:id])
    if @bug
      @id = params[:id]
      @administered = @bug.try(:administered)
      @metabolized_in = @bug.try(:metabolized_in)
      @mechanism = @bug.try(:mechanism) || 'Unknown'
      # @side_effects = ['Death','Vomiting','Myelosuppression']
      @side_effects = @bug.try(:tox_to_a)
      render :show_preview
    else
      alert_js('ERROR: No such bug...')
    end
  end

end