class UsersController < ApplicationController
  def index
    @users = User.all #allメソッドはusersテーブルのレコードを全て取得できるメソッド
    @posts = Post.all #postsテーブルの全データを取得する
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :age, :introduction))
    binding.pry
    if @user.save
      binding.pry
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users
    else
      binding.pry
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    #@posts = Post.where(user_id: @user.id) #この記述でも実装できる
    @posts = @user.posts #リレーションを定義することでこのような記述が可能
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :age, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :users
  end
end
