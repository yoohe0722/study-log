class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :date, :date
    add_column :posts, :study_time, :integer
  end
end
