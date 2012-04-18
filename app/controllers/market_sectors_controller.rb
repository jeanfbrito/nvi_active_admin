class MarketSectorsController < InheritedResources::Base

  def show
    @market_sector = MarketSector.find(params[:id])
    @online_courses = @market_sector.online_courses
    @onsite_courses = @market_sector.onsite_courses
    set_tab @market_sector.name.parameterize.underscore.to_sym
  end

end
