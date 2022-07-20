class CreateTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonials do |t|
      t.string :account
      t.string :comment
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
