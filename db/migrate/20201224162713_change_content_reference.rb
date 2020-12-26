class ChangeContentReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :contents, :content_types, foreign_key: true
  end
end
