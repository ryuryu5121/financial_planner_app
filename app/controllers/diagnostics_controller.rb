class DiagnosticsController < ApplicationController
  def index
  end

  def show
  end

  def diagnostic
    @result = { years_old: params[:years_old], family: params[:family], salary: params[:salary], rent: params[:rent], food_expenses: params[:food_expenses], utility_bills: params[:utility_bills], clothes: params[:clothes], medical_insurance: params[:medical_insurance], communication_cost: params[:communication_cost], education_cost: params[:education_cost], entertainment_cost: params[:entertainment], saving: params[:saving], anyother: params[:anyother]}
    redirect_to diagnostics_show_path(result: @result)
  end

  def diagnostics_years_old(years_old)
    if years_old < 30

    elsif years_old < 40

    elsif years_old < 50

    elsif years_old < 60

    elsif years_old < 70

    else

    end
  end

  def compare_data(result)

  end

  def money_data_20s
    money_data_20s = [40000, 54000, 17000, 9000, 9000, 38000, 2000, 19000, 5, 43000]
  end

  def money_data_30s
    money_data_30s = [24000, 73000, 21000, 11000, 12000, 43000, 8000, 29000, 77, 40000]
  end

  def money_data_40s
    money_data_40s = [17000, 84000, 24000, 13000, 13000, 52000, 26000, 33000, 50, 52000]
  end

  def money_data_50s
    money_data_50s = [19000, 84000, 26000, 14000, 12000, 14000, 29000, 30000, 54, 75000]
  end

  def money_data_60s
    money_data_60s = [21000, 81000, 26000, 9000, 16000, 48000, 4000, 26000, 300, 66000]
  end

  def money_data_olders
    money_data_olders = [20000, 74000, 25000, 7000, 15000, 32000, 1000, 24000, 1500, 51000]
  end
end
