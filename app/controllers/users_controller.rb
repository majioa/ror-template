class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordInvalid, with: :render_error

  # GET /users
  # GET /users.json
  def index
    @users = User.all.decorate
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save!

    render_success
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.update!(user_params)

    render_success
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {}).permit(:email, :password, :password_confirmation)
  end

  def render_error
    respond_to do |format|
      format.html { render action_map }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def render_success
    respond_to do |format|
      format.html { redirect_to @user, notice: t(action_name) }
      format.json { render :show, status: :created, location: @user }
    end
  end

  def action_map
     {  
        create: :new,
        update: :edit,
     }[action_name.to_sym] || action_name
  end
end
