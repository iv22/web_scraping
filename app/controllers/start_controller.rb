class StartController < ActionController::Base
  def index
    upload
  end

  private

  def upload    
    type_id = ContentType.where(name: 'job vacancy').first.id
    resource = RabotaBy.resource
    data = RabotaBy.new    
    data.each do |vacancy|            
      AddScrapingWorker.perform_async(type_id, resource, vacancy.body, vacancy.url)      
    end  
  end
end