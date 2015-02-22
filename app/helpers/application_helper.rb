module ApplicationHelper

  def flash_level_to_bootstrap(level)
    case level
    when "alert"
      "danger"
    else
      "success"
    end
  end

end
