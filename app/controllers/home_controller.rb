class HomeController < ApplicationController
  def dictionary
    @q        = params[:q]
    @dict     = params[:dict]
    klass     = params[:dict] == 'ig-en' ? IgboEntry : EnglishEntry
    @results  = klass.where('term LIKE ?', "#{@q}%").paginate(:page => params[:page])
  end
end
