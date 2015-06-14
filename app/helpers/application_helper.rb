module ApplicationHelper
  def current_user?
    current_user.present?
  end

  def navbar_link_to(*args, &block)
    list_options = {}
    list_options[:class] = 'active' if current_page? args.last
    content_tag :li, list_options do
      link_to(*args, &block)
    end
  end
end
