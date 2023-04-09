class AddResumeUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :user_id, :integer
  end
end
