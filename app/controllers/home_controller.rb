class HomeController < ApplicationController
  def dictionary
    @q        = params[:q]
    @dict     = params[:dict]
    
    if @q
      klass     = params[:dict] == 'ig-en' ? IgboEntry : EnglishEntry
      @results  = klass.where('term LIKE ?', "#{@q}%").paginate(:page => params[:page], :per_page => 20)
    end
  end
end
