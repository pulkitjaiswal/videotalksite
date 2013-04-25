class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def profile
    @user = current_user
    @avatar = Avatar.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }

    end
  end

  def upload_avatar
    @user = current_user
    @avatar = Avatar.new()
    @avatar.user_id = current_user.id
    @avatar.upload = params[:avatar][:upload][0]
    @avatar.save
    render json: [@avatar.to_jq_upload].to_json
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: [@avatar.to_jq_upload].to_json }
    #  format.js{ render js: 'alert("adsd")'}
    #end
  end
  def update_avatar
    @user = current_user
    @avatar = Avatar.find(params[:id])
    @user.image_url = @avatar.upload.thumb.url
    if @user.save
      render json: {:url => @avatar.upload.thumb.url}
    else
      render json: {}
    end
  end
end
