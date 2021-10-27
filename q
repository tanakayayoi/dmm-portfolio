
[1mFrom:[0m /home/ec2-user/environment/Portfolio/app/views/homes/top.html.erb:20 ActionView::CompiledTemplates#_app_views_homes_top_html_erb__1045375350185507638_62044640:

    [1;34m15[0m: 
    [1;34m16[0m: <div class="row">
    [1;34m17[0m:   <div class="col-md-9">
    [1;34m18[0m:     <h3 class="text-center mt-3">人気の投稿</h3>
    [1;34m19[0m:     <% binding.pry %>
 => [1;34m20[0m:     <%= render 'posts/index', posts: @posts, post_tags: @post_tags %>
    [1;34m21[0m:     <p class="text-center"><strong>投稿一覧は<%= link_to 'こちら', posts_path %></strong></p>
    [1;34m22[0m:   </div>
    [1;34m23[0m: 
    [1;34m24[0m:   <div class="col-md-3">
    [1;34m25[0m:     <h3 class="text-center my-3">タグリスト</h3>

