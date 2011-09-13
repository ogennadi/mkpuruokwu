class HomeController < ApplicationController
  def dictionary
    term = IgboEntry.find_by_term(params[:q])
    @result = term ? term.definition : "none"
  end
end
