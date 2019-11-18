class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.integer :position
      t.belongs_to :presentation, foreign_key: true

      t.timestamps
    end
  end
end
