module ApplicationHelper
  def alert_style_type(type)
    if type == 'notice'
      return 'alert-success' 
    elsif type == 'alert'
      return 'alert-danger'
    end
  end
end
