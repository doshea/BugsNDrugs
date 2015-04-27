module ApplicationHelper

  def is_admin?
    @current_user.present? && @current_user.is_admin
  end

  def is_logged_in?
    @current_user.present?
  end

  def title(s, override=false)
    content_for(:title){override ? s : "#{s} | BugsNDrugs"}
  end

  def title_backup
    if content_for? :title
      return nil
    else
      'BugsNDrugs'
    end
  end

end