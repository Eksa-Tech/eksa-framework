class PostsController < Eksa::Controller
  def index
    @posts = Eksa::MarkdownPost.all
    render "posts/index"
  end

  def show
    @post = Eksa::MarkdownPost.find(params['slug'])
    if @post
      render "posts/show"
    else
      [404, { 'content-type' => 'text/html' }, ["Post not found"]]
    end
  end
end
