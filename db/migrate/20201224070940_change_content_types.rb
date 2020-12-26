class ChangeContentTypes < ActiveRecord::Migration[6.0]
  def change
    add_index(:content_types, :name, unique: true)
  end
end
