class Admin::LoadController < ApplicationController
  before_action :authenticate_admin!

  def index            
  end

  def onliner    
    type_id = ContentType.where(name: 'article').first.id
    scrap(type_id, 'OnlinerNews', params[:start_date], params[:end_date])            

    render :index
  end

  def rabotaby
    type_id = ContentType.where(name: 'job vacancy').first.id
    scrap(type_id, 'RabotaBy', params[:criteria])                

    render :index
  end

  private

  def scrap(type_id, class_name, *new_params)            
    AddScrapingWorker.perform_async(type_id, class_name, *new_params)
  end
end