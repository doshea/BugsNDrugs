class PagesController < ApplicationController
  def index
  end
  #GET /live_search or live_search_path
  def live_search
    max_results = 15

    query = params[:query]
    @bug_classes = BugClass.starts_with(query).limit(max_results)
    @bugs = Bug.starts_with(query).limit(max_results)
    @drug_classes = DrugClass.starts_with(query).limit(max_results)
    @drugs = Drug.starts_with(query).limit(max_results)
    @symptoms = Symptom.starts_with(query).limit(max_results)

    split_ways = (@bug_classes.any? ? 1 : 0) + (@bugs.any? ? 1 : 0) + (@drug_classes.any? ? 1 : 0) + (@drugs.any? ? 1 : 0) + (@symptoms.any? ? 1 : 0)
    split_ways += 1 if split_ways == 0
    split_results = max_results / split_ways

    @bug_classes = @bug_classes.limit(split_results)
    @bugs = @bugs.limit(split_results)
    @drug_classes = @drug_classes.limit(split_results)
    @drugs = @drugs.limit(split_results)
    @symptoms = @symptoms.limit(split_results)
    
    @result_count = @bug_classes.length + @bugs.length + @drug_classes.length + @drugs.length + @symptoms.length
  end
end