class BugClassesController < ApplicationController

  def index
  end

  def show
    @bc = BugClass.find(params[:id])
    child = @bc
    @lineage = []
    while child.bug_class
      @lineage = [child.bug_class] + @lineage
      child = child.bug_class
    end
  end

end