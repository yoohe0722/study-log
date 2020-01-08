class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string      :name
        t.text        :text
        t.text        :image
        t.timestamps null: true
    end
  end
end
