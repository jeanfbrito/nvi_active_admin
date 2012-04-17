class PagesController < HighVoltage::PagesController
  layout :layout_for_page
  before_filter :choose_tab

  protected
  
  def choose_tab
    case params[:id]
    when 'index' then set_tab 'home'
    end
  end

  def layout_for_page
    'application'
  end
end