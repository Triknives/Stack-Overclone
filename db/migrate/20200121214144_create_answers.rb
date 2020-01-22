class CreateAnswers < ActiveRecord::Migration[5.2]
    def change
        create_table :answers do |t|
            t.column :body, :string
            t.column :points, :integer
            t.column :question_id, :integer
            t.column :user_id, :integer
        end
    end
end
