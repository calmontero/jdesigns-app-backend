class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :job, null: false, foreign_key: true
      t.string :image_link

      t.timestamps
    end
  end
end
