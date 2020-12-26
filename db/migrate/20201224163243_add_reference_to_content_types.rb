class AddReferenceToContentTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :contents, :content_type, foreign_key: true
  end
end
