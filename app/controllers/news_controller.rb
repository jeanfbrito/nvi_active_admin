class NewsController < InheritedResources::Base

  def index
    @news = News.published
  end

end
