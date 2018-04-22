class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :tags
      t.datetime :estimated_duration
      t.integer :user_id

      t.timestamps
    end
  end
end
