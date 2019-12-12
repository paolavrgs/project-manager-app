class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show; end

  # GET /developers/new
  def new
    @user = User.new
    @developer = Developer.new(user: @user)
  end

  # GET /developers/1/edit
  def edit; end

  # POST /developers
  # POST /developers.json
  def create
    @developer = Developer.new(developer_params)
    dev_user = create_developer_user(@developer, user_params)
    respond_to do |format|
      if dev_user.dig(:status)
        format.html { redirect_to dev_user.dig(:developer), notice: 'Developer was successfully created.' }
        format.json { render :show, status: :created, location: dev_user.dig(:developer) }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'Developer was successfully updated.' }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_developer
    @developer = Developer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def developer_params
    params.require(:developer).permit(:name, :level, :avatar, :user_id, techs: [])
  end

  def user_params
    params.require(:developer).require(:user).permit(:email, :password, :password_confirmation)
  end

  # PLEASE MOVE THIS TO A SERVICE
  def create_developer_user(developer_instance, user_params)
    user = User.new(user_params)
    developer_instance.transaction do
      user.add_role(:developer)
      user.save!
      developer_instance.user = user
      developer_instance.save!
      return {
        developer: developer_instance,
        status: true
      }
    end
    {}
  end
end
