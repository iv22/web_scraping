class AddScrapingWorker
  include Sidekiq::Worker

  def perform(type_id, class_name, *new_params)    
    clazz = class_name.constantize
    data = clazz.new(*new_params)
    data.each_with_index do |content, i|                  
      Content.create(resource: clazz.resource, 
        content_type_id: type_id, 
        body: content.body, 
        url: content.url,
        actual_date: content.actual_date)    
        p DateTime.now
      sleep(rand(i) / 10.0)  
    end
  end
end