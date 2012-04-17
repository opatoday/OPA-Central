ActiveAdmin.register UserProfile do
  controller do
    def show
        @post = Post.find(params[:id])
        @versions = @post.versions 
        @post = @post.versions[params[:version].to_i].reify if params[:version]
        show! #it seems to need this
    end
  end
  sidebar :versionate, :partial => "layouts/version", :only => :show
end
