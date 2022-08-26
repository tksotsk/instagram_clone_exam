class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to pictures_path(@user.id)
      else
          render :new
      end
  end

  def show
      @user = User.find(params[:id])
      @pictures = Picture.where(user_id: current_user.id).where.not(image: nil)
      
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "Picture was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity, notice: "Failed."}
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :image, :image_cache, :password, :password_confirmation)
  end
end
