module ApplicationHelper
  def background_color(controller)
    case controller.controller_name
    when 'reservations'
      'white'
    when 'users'
      'red'
    end
  end
end
