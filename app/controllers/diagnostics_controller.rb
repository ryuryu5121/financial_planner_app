class DiagnosticsController < ApplicationController
  MONWY_DATA_20S = { rent: 40000, food_expenses: 54000, utility_bills: 17000, clothes: 9000, medical_insurance: 9000, communication_cost: 38000, education_cost: 2000, entertainment_cost: 19000, saving: 5, anyother: 43000}

  MONWY_DATA_30S = { rent: 24000, food_expenses: 73000, utility_bills: 21000, clothes: 11000, medical_insurance: 12000, communication_cost: 43000, education_cost: 8000, entertainment_cost: 29000, saving: 77, anyother: 40000}

  MONWY_DATA_40S = { rent: 17000, food_expenses: 84000, utility_bills: 24000, clothes: 13000, medical_insurance: 13000, communication_cost: 52000, education_cost: 26000, entertainment_cost: 33000, saving: 50, anyother: 52000}

  MONWY_DATA_50S = { rent: 19000, food_expenses: 84000, utility_bills: 26000, clothes: 14000, medical_insurance: 12000, communication_cost: 14000, education_cost: 29000, entertainment_cost: 30000, saving: 54, anyother: 75000}

  MONWY_DATA_60S = { rent: 21000, food_expenses: 81000, utility_bills: 26000, clothes: 9000, medical_insurance: 16000, communication_cost: 48000, education_cost: 4000, entertainment_cost: 26000, saving: 300, anyother: 66000}

  MONWY_DATA_OLDERS = { rent: 20000, food_expenses: 74000, utility_bills: 25000, clothes: 7000, medical_insurance: 15000, communication_cost: 32000, education_cost: 1000, entertainment_cost: 24000, saving: 1500, anyother: 51000}


  def index
  end

  def show
    @user_diagnostic = { years_old: params[:years_old], family: params[:family], salary: params[:salary], rent: params[:rent], food_expenses: params[:food_expenses], utility_bills: params[:utility_bills], clothes: params[:clothes], medical_insurance: params[:medical_insurance], communication_cost: params[:communication_cost], education_cost: params[:education_cost], entertainment_cost: params[:entertainment], saving: params[:saving], anyother: params[:anyother]}
    years_old = params[:years_old]
    @average = average(years_old)
    @result = diagnostics_years_old(years_old, @user_diagnostic)
  end

  def diagnostic
    @user_diagnostic = { years_old: params[:years_old], family: params[:family], salary: params[:salary], rent: params[:rent], food_expenses: params[:food_expenses], utility_bills: params[:utility_bills], clothes: params[:clothes], medical_insurance: params[:medical_insurance], communication_cost: params[:communication_cost], education_cost: params[:education_cost], entertainment_cost: params[:entertainment], saving: params[:saving], anyother: params[:anyother]}
    redirect_to diagnostics_show_path(result: @result)
  end

  def diagnostics_years_old(years_old, user_diagnostic)
    if years_old < 30
      compare_data(user_diagnostic, MONWY_DATA_20S)
    elsif years_old < 40
      compare_data(user_diagnostic, MONWY_DATA_30S)
    elsif years_old < 50
      compare_data(user_diagnostic, MONWY_DATA_40S)
    elsif years_old < 60
      compare_data(user_diagnostic, MONWY_DATA_50S)
    elsif years_old < 70
      compare_data(user_diagnostic, MONWY_DATA_60S)
    else
      compare_data(user_diagnostic, MONWY_DATA_OLDERS)
    end
  end

  def compare_data(user_diagnostic, money_data)
    { rent: user_diagnostic[:rent] - money_data[:rent], food_expenses: user_diagnostic[:food_expenses] - money_data[:food_expenses], utility_bills: user_diagnostic[:utility_bills] - money_data[:utility_bills], clothes: user_diagnostic[:clothes] - money_data[:clothes], medical_insurance: user_diagnostic[:medical_insurance] - money_data[:medical_insurance], communication_cost: user_diagnostic[:communication_cost] - money_data[:communication_cost], education_cost: user_diagnostic[:education_cost] - money_data[:education_cost], entertainment_cost: user_diagnostic[:entertainment_cost] - money_data[:entertainment_cost], saving: user_diagnostic[:saving] - money_data[:saving], anyother: user_diagnostic[:anyother] - money_data[:anyother]}
  end

  def average(years_old)
    if years_old < 30
      MONWY_DATA_20S
    elsif years_old < 40
      MONWY_DATA_30S
    elsif years_old < 50
      MONWY_DATA_40S
    elsif years_old < 60
      MONWY_DATA_50S
    elsif years_old < 70
      MONWY_DATA_60S
    else
      MONWY_DATA_OLDERS
    end
  end


  money_data_20s = [40000, 54000, 17000, 9000, 9000, 38000, 2000, 19000, 5, 43000]

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
