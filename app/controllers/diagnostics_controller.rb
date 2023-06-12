class DiagnosticsController < ApplicationController
  def index
  end

  def show
  end

  def diagnostic
    @result = { years_old: params[:years_old], family: params[:family], salary: params[:salary], rent: params[:rent], food_expenses: params[:food_expenses], utility_bills: params[:utility_bills], clothes: params[:clothes], medical_insurance: params[:medical_insurance], communication_cost: params[:communication_cost], education_cost: params[:education_cost], entertainment_cost: params[:entertainment], saving: params[:saving], anyother: params[:anyother]}
    redirect_to diagnostics_show_path(result: @result)
  end
end
