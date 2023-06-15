module FpSessionsHelper
  def financial_planner_log_in(financial_planner)
    session[:financial_planner_id] = financial_planner.id
  end

  def current_financial_planner
    if session[:financial_planner_id]
      @current_financial_planner ||= FinancialPlanner.find_by(id: session[:financial_planner_id])
    end
  end

  def financial_planner_logged_in?
    !current_financial_planner.nil?
  end

  def financial_planner_log_out
    reset_session
    @current_financial_planner = nil
  end
end
