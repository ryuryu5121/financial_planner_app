module UsersHelper
  def find_by_fp(fp_id)
    FinancialPlanner.find_by(id: fp_id)
  end
end
