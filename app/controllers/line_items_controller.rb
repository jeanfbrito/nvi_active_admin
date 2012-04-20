class LineItemsController < InheritedResources::Base
  def create
    @line_item = current_cart.line_items.new(params[:line_item])
    if @line_item.save
      redirect_to :cart
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to :cart
  end

end
