module ApplicationHelper
  def markdown(text)
    # options = {
    #   filter_html:     false,
    #   hard_wrap:       true,
    #   link_attributes: { rel: 'nofollow', target: '_blank' },
    #   space_after_headers: true,
    #   fenced_code_blocks: true
    # }

    # extensions = {
    #   autolink:           true,
    #   superscript:        true,
    #   disable_indented_code_blocks: true
    # }

    markdown = Redcarpet::Markdown.new(PygmentsHTML, autolink: true, tables: true, linebreak: true, fenced_code_blocks: true)

    markdown.render(text).html_safe
  end
end
