module FpSessionsHelper
  def fp_log_in(financial_planner)
    session[:fp_id] = financial_planner.id
  end

  def current_fp
    if session[:fp_id]
      @current_fp ||= FinancialPlanner.find_by(id: session[:fp_id])
    end
  end

  def fp_logged_in?
    !current_fp.nil?
  end

  def fp_log_out
    reset_session
    @current_fp = nil
  end
end
