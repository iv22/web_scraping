class Admin::LoadController < ApplicationController
  before_action :authenticate_admin!

  def index    
  end

  def onliner    
    type_id = ContentType.where(name: 'article').first.id
    start_date = params[:start_date]
    end_date = params[:end_date]
    data = OnlinerNews.new(start_date, end_date)    
    scrap(type_id, OnlinerNews.resource, data)
  end

  def rabotaby
    type_id = ContentType.where(name: 'job vacancy').first.id
    criteria = params[:criteria]
    data = RabotaBy.new(criteria)
    scrap(type_id, RabotaBy.resource, data)
  end

  private

  def scrap(type_id, resource, data)            
    data.each do |vacancy|            
      AddScrapingWorker.perform_async(type_id, resource, vacancy.body, vacancy.url)      
    end  
  end
end