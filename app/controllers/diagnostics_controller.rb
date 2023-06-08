class DiagnosticsController < ApplicationController
  def index
  end

  def show
  end

  def diagnostic
    redirect_to diagnostics_show_path
  end
end
