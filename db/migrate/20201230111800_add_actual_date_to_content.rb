  class AddActualDateToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :actual_date, :date, null: false
  end
end
