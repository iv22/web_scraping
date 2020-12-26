class ChangeContents < ActiveRecord::Migration[6.0]
  def change
    add_index :contents, :body, using: :gin
    # execute <<-SQL
    #   CREATE INDEX user_prefs_newsletter_index ON users ((preferences->>'newsletter'))
    # SQL
  end
end
