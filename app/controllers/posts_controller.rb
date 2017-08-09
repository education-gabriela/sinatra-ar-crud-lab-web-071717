class PostsController < ApplicationController
  get "/posts/new" do
    erb :"posts/new"
  end

  post "/posts" do
    Post.create(params)
    redirect "/posts"
  end

  get "/posts" do
    @all_posts = Post.all
    erb :"posts/index"
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end

  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :"posts/show"
  end

  patch "/posts/:id" do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])

    redirect "/posts/#{@post.id}"
  end

  delete "/posts/:id" do
    @post = Post.find(params[:id])
    @post.destroy

    erb :"/posts/delete"
  end
end