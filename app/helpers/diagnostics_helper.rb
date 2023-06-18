module DiagnosticsHelper
  def return_message(result, item)
    if item === :saving
      if result > 0
        "平均より#{result}万円上回っています!素晴らしいです!"
      elsif result < 0
        "平均より#{-result}万円下回っています!見直しましょう!"
      else
        "平均と同額です!!"
      end
    else
      if result > 0
        "平均より#{result}円上回っています!見直しましょう!"
      elsif result < 0
        "平均より#{-result}円下回っています!素晴らしいです!"
      else
        "平均と同額です!!"
      end
    end
  end

  def change_items_name(item)
    if item === :rent
      "家賃"
    elsif item === :food_expense
      "食費"
    elsif item === :utility_bills
      "水道・光熱費"
    elsif item === :clothes
      "衣服費"
    elsif item === :medical_insurance
      "医療費"
    elsif item === :communication_cost
      "通信費"
    elsif item === :education_cost
      "教育費"
    elsif item === :entertainment_cost
      "娯楽費"
    elsif item === :saving
      "貯金"
    elsif item === :anyother
      "その他"
    end
  end

  def insert_man_message(item)
    if item === :saving
      "万"
    end
  end
end
