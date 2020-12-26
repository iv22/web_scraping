class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.jsonb :body
      t.string :url, limit: 500
      t.string :resource, limit: 60
      t.references :content_types, null: false, foreign_key: true

      t.timestamps
    end
  end
end
