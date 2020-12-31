class OnlinerMoodController < ApplicationController
  def index     
    @data = Content.onliner_mood_by_year    
    p @data
    # var data = JSON.parse('<%= @data.to_json.html_safe -%>');
    # data = [['Year/Month', 'Amount']].concat(data);
  end
end