module ApplicationHelper

  def add_to_cart(purchasable)
    button_to "Add to cart", add_to_cart_path(line_item: {purchasable_id: purchasable.id, purchasable_type: purchasable.class}), class: 'btn btn-primary btn-mini'
  end

  def remove_from_cart(line_item)
    button_to "Remove", remove_from_cart_path(id: line_item.id), class: 'btn btn-danger'
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
    # options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    markdown.render(text).html_safe
  end

end
