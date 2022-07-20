class CreateDownloads < ActiveRecord::Migration[6.1]
  def change
    create_table :downloads do |t|
      t.belongs_to :design, null: false, foreign_key: true
      t.string :email
      t.integer :autho_code
      t.datetime :date
      t.integer :statud

      t.timestamps
    end
  end
end
