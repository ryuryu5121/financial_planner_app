class DiagnosticsController < ApplicationController
  MONEY_DATA_20S = { rent: 40000, food_expense: 54000, utility_bills: 17000, clothes: 9000, medical_insurance: 9000, communication_cost: 38000, education_cost: 2000, entertainment_cost: 19000, saving: 5, anyother: 43000}

  MONEY_DATA_30S = { rent: 24000, food_expense: 73000, utility_bills: 21000, clothes: 11000, medical_insurance: 12000, communication_cost: 43000, education_cost: 8000, entertainment_cost: 29000, saving: 77, anyother: 40000}

  MONEY_DATA_40S = { rent: 17000, food_expense: 84000, utility_bills: 24000, clothes: 13000, medical_insurance: 13000, communication_cost: 52000, education_cost: 26000, entertainment_cost: 33000, saving: 50, anyother: 52000}

  MONEY_DATA_50S = { rent: 19000, food_expense: 84000, utility_bills: 26000, clothes: 14000, medical_insurance: 12000, communication_cost: 14000, education_cost: 29000, entertainment_cost: 30000, saving: 54, anyother: 75000}

  MONEY_DATA_60S = { rent: 21000, food_expense: 81000, utility_bills: 26000, clothes: 9000, medical_insurance: 16000, communication_cost: 48000, education_cost: 4000, entertainment_cost: 26000, saving: 300, anyother: 66000}

  MONEY_DATA_OLDERS = { rent: 20000, food_expense: 74000, utility_bills: 25000, clothes: 7000, medical_insurance: 15000, communication_cost: 32000, education_cost: 1000, entertainment_cost: 24000, saving: 1500, anyother: 51000}


  def index
  end

  def show
    @user_diagnostic = { years_old: params[:result][:years_old].to_i, family: params[:result][:family].to_i, salary: params[:result][:salary].to_i, rent: params[:result][:rent].to_i, food_expense: params[:result][:food_expense].to_i, utility_bills: params[:result][:utility_bills].to_i, clothes: params[:result][:clothes].to_i, medical_insurance: params[:result][:medical_insurance].to_i, communication_cost: params[:result][:communication_cost].to_i, education_cost: params[:result][:education_cost].to_i, entertainment_cost: params[:result][:entertainment].to_i, saving: params[:result][:saving].to_i, anyother: params[:result][:anyother].to_i}
    @years_old = params[:years_old].to_i
    @average = average(@years_old)
    @result = diagnostics_years_old(@years_old, @user_diagnostic)
    @items = [ 'rent', 'food_expense', 'utility_bills', 'clothes', 'medical_insurance' , 'communication_cost', 'education_cost', 'entertainment_cost', 'saving', 'anyother' ]
    @count = count_money_problems(@result)
  end

  def diagnostic
    @user_diagnostic = { years_old: params[:years_old], family: params[:family], salary: params[:salary], rent: params[:rent], food_expense: params[:food_expense], utility_bills: params[:utility_bills], clothes: params[:clothes], medical_insurance: params[:medical_insurance], communication_cost: params[:communication_cost], education_cost: params[:education_cost], entertainment_cost: params[:entertainment], saving: params[:saving], anyother: params[:anyother]}
    redirect_to diagnostics_show_path(result: @user_diagnostic)
  end

  private

  def diagnostics_years_old(years_old, user_diagnostic)
    if years_old < 30
      compare_data(user_diagnostic, MONEY_DATA_20S)
    elsif years_old < 40
      compare_data(user_diagnostic, MONEY_DATA_30S)
    elsif years_old < 50
      compare_data(user_diagnostic, MONEY_DATA_40S)
    elsif years_old < 60
      compare_data(user_diagnostic, MONEY_DATA_50S)
    elsif years_old < 70
      compare_data(user_diagnostic, MONEY_DATA_60S)
    else
      compare_data(user_diagnostic, MONEY_DATA_OLDERS)
    end
  end

  def compare_data(user_diagnostic, money_data)
    { rent: user_diagnostic[:rent] - money_data[:rent], food_expense: user_diagnostic[:food_expense] - money_data[:food_expense], utility_bills: user_diagnostic[:utility_bills] - money_data[:utility_bills], clothes: user_diagnostic[:clothes] - money_data[:clothes], medical_insurance: user_diagnostic[:medical_insurance] - money_data[:medical_insurance], communication_cost: user_diagnostic[:communication_cost] - money_data[:communication_cost], education_cost: user_diagnostic[:education_cost] - money_data[:education_cost], entertainment_cost: user_diagnostic[:entertainment_cost] - money_data[:entertainment_cost], saving: user_diagnostic[:saving] - money_data[:saving], anyother: user_diagnostic[:anyother] - money_data[:anyother]}
  end

  def average(years_old)
    if years_old < 30
      MONEY_DATA_20S
    elsif years_old < 40
      MONEY_DATA_30S
    elsif years_old < 50
      MONEY_DATA_40S
    elsif years_old < 60
      MONEY_DATA_50S
    elsif years_old < 70
      MONEY_DATA_60S
    else
      MONEY_DATA_OLDERS
    end
  end

  def count_money_problems(result)
    count = 0
    result.each do |key, value|
      if key == :saving && value < 0
        count += 1
      elsif value > 0
        count += 1
      end
    end
    count
  end
end
