class NavigationTabBuilder < TabsOnRails::Tabs::Builder
  def open_tabs(options = {})
    @context.tag("ul", options, open = true)
  end

  def close_tabs(options = {})
    "</ul>".html_safe
  end

  def tab_for(tab, name, options, item_options = {})
    item_options[:class] ||= ""
    item_options[:class] += (current_tab?(tab) ? ' selected' : '')
    @context.content_tag(:li, item_options) do
      @context.link_to(name, options, item_options)
    end
  end
end