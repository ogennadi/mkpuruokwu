class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_variables
  
  def set_variables
    @igbo_count     = IgboEntry.count
    @english_count  = EnglishEntry.count
  end
end
