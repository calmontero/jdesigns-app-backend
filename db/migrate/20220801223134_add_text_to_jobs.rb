class AddTextToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :text, :string
  end
end
