module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  def dat_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :no_intra_emphasis => true, :autolink => true, :footnotes => true, :hard_wrap => true)
    markdown.render(text).html_safe
  end
end
