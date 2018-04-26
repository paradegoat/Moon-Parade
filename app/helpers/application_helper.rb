module ApplicationHelper
  def login_helper style = ' '
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def image_link_to(image_path, url, image_tag_options = { }, link_to_options = { })
  link_to url, link_to_options do
    image_tag image_path, image_tag_options
    end
  end

def alerts
   alert = (flash[:alert] || flash[:error] || flash[:notice])

   if alert
     alert_generator alert
   end
 end

 def alert_generator msg
   js add_gritter(msg, title: "Homecoming Spirit", sticky: false)
 end

end
