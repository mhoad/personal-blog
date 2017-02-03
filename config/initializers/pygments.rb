class PygmentsHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    options = { encoding: 'utf-8', linenos: true }
    Pygments.highlight(code, lexer: language, options: options)
  end
end
