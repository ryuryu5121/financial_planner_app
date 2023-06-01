module UsersHelper
  def find_fp(fp_id)
    @fp_id = FinancialPlanner.find_by(id: fp_id)
  end
end
