class AddActualYearColumnToContent < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      ALTER TABLE Contents ADD COLUMN IF NOT EXISTS actual_year integer \
        GENERATED ALWAYS AS (extract(year from actual_date)) STORED
    SQL
  end
end
