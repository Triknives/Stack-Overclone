class CreateQuestions < ActiveRecord::Migration[5.2]
    def change
        create_table :questions do |t|
            t.column :title, :string
            t.column :body, :string
            t.column :language, :string
            t.column :points, :integer
            t.column :user_id, :integer
        end
    end
end
