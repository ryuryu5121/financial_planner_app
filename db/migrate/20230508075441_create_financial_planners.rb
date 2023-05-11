class CreateFinancialPlanners < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_planners do |t|
      t.string :name
      t.string :email
      t.integer :price

      t.timestamps
    end
  end
end
