class AddScrapingWorker
  include Sidekiq::Worker

  def perform(type_id, resource, body, url)    
    Content.create(resource: resource, content_type_id: type_id, body: body, url: url)    
  end
end