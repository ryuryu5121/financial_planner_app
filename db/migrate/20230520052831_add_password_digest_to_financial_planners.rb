class AddPasswordDigestToFinancialPlanners < ActiveRecord::Migration[7.0]
  def change
    add_column :financial_planners, :password_digest, :string
  end
end
