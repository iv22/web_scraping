class Admin::LoadController < ApplicationController
  before_action :authenticate_admin!

  def index            
  end

  def onliner    
    type_id = ContentType.where(name: 'article').first.id
    scrap('Onliner', type_id, 'OnlinerNews', params[:start_date], params[:end_date])                
  end

  def rabotaby
    type_id = ContentType.where(name: 'job vacancy').first.id
    scrap('RabotaBy', type_id, 'RabotaBy', params[:criteria])                
  end

  private

  def scrap(source, type_id, class_name, *new_params)            
    AddScrapingWorker.perform_async(type_id, class_name, *new_params)
    render json: { status: "#{ source } process is running at #{ DateTime.now }" }
  end
end