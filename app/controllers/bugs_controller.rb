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

end