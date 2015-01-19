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
      render :show_preview
    else
      alert_js('ERROR: No such bug...')
    end
  end

  def refresh_preview
    @bug = Bug.find(params[:id])
    if @bug
      @id = params[:id]
      render :refresh_preview
    else
      alert_js('ERROR: No such bug...')
    end
  end

end