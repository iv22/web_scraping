class AddScrapingWorker
  include Sidekiq::Worker

  def perform(type_id, resource, body, url, actual_date)    
    Content.create(resource: resource, content_type_id: type_id, body: body, url: url,actual_date: actual_date)    
  end
end