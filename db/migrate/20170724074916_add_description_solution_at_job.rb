class AddDescriptionSolutionAtJob < ActiveRecord::Migration[5.1]
  def change
    add_column :job_requests, :description_solution, :string
    add_column :job_requests, :time_spent, :integer
    add_column :job_requests, :date_return, :date_return
    add_column :job_requests, :statut, :string
  end
end
