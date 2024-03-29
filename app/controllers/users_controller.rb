class UsersController < ApplicationController
  wrap_parameters :user, include: %i[email password first_name last_name dob gender]

  before_action :set_user, only: %i[show edit update destroy]

  before_action :validate_record_owner, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = current_user&.admin? ? User.all : User.where(id: current_user&.id)
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        NotifierMailer.welcome(@user.id).deliver_later

        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def record_owner_id = @user&.id

  def set_user = @user = User.find(params[:id])

  def user_params
    params
      .require(:user)
      .permit(:email, :password, :first_name, :last_name, :dob, :gender)
  end
end
