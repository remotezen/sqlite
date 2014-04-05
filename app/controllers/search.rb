Blog::App.controllers :search do
  post :create do
    @title = "Jo Goes Green Search Results"
=begin    
    q  = params[:search]
    @search = Post.find(:all, :conditions => ["body like  ? or title like ?",q,q])
    render 'search/search'
    @search = Post.find(:all, :conditions => ["body like  ? or title like ?", q,q] )
    render 'search/search'
=end    

#@search = ThinkingSphinx.search params[:search], :classes => [Post, Comment, Recipe]
    @search = ThinkingSphinx.search params[:search],
      :page=> params[:page], :per_page => 9, 
      :classes => [Post, Comment, Recipe]
    render 'search/search'

  end    
  get :create  do
    @title = "Jo Goes Green Search results page #{params[:page] }"
=begin    
    q  = params[:search]
    @search = Post.find(:all, :conditions => ["body like  ? or title like ?",q,q])
    render 'search/search'
    @search = Post.find(:all, :conditions => ["body like  ? or title like ?", q,q] )
    render 'search/search'
=end    

#@search = ThinkingSphinx.search params[:search], :classes => [Post, Comment, Recipe]
    @search = ThinkingSphinx.search params[:search],
      :page=> params[:page], :per_page => 9, 
      :classes => [Post, Comment, Recipe]
    render 'search/search'

  end    
  

end
