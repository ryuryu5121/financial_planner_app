class DiagnosticsController < ApplicationController
  def index
  end

  def show
  end

  def diagnostic
    @result = { years_old: params[:years_old] }
    redirect_to diagnostics_show_path(result: @result)
  end
end
