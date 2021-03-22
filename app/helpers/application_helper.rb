module ApplicationHelper
  def buttons(sign_in)
    if sign_in
      render :partial => 'logged'
    else
      render :partial => 'normal'
    end
  end
end
