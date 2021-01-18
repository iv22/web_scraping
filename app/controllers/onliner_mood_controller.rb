class OnlinerMoodController < ApplicationController
  def index
    @data = Content.onliner_mood_by_year
  end
end
