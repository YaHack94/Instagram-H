class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :image
      t.string :content

      t.timestamps
    end
  end
end
