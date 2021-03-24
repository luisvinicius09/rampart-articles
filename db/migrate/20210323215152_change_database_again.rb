class ChangeDatabaseAgain < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :article, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
