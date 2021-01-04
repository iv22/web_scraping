class AddActualYearColumnToContent < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE Contents ADD COLUMN IF NOT EXISTS actual_year integer \
        GENERATED ALWAYS AS (date_part('year', actual_date)) STORED
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE Contents DROP COLUMN actual_year
    SQL
  end
end
