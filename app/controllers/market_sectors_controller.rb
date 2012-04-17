class MarketSectorsController < InheritedResources::Base

  def show
    @market_sector = MarketSector.find(params[:id])
    set_tab @market_sector.name.parameterize.underscore.to_sym
  end

end
