class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 # before_action :set_report, only: [:edit_report]
  skip_before_action :check_permission, only: [:login_page, :login]

  # GET /users
  # GET /users.json
  def index
    @users = User.where(role: '2')#all
  end

  def dashboard
    @students = Student.order("total DESC")
  end

  def report
    
  end

  def teacher_dashboard
    @reports = Report.where(subject_id: current_user.subject.id)
    @user = current_user
    @subject = Subject.find_by(user_id: current_user.id)
  end

  def edit_report
     @report = Report.find(params[:format])
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
    @user.role = '2'
    @user.password = params[:user][:password_digest]
  
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      
      if @user.update(user_params)
        @user.update(password: params[:user][:password_digest])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def login_page
    
  end

  def login
    auth_user =  User.authenticate(params[:username_or_email],params[:password])
      if auth_user
        session[:user_id] = auth_user.id
          if User.find_by(id: session[:user_id]).role == "1"
              redirect_to dashboard_path
          elsif User.find_by(id: session[:user_id]).role == "2"
               redirect_to teacher_dashboard_path
          end
        #flash[:notice] = "Wow Welcome again, you logged in as #{auth_user.name}"
        #redirect_to users_path
      else
          
        redirect_to root_path, alert: "Wrong username or password. Please try again."
    end

  end

  def log_out
    auth_user = User.find(session[:user_id])
    session[:user_id]= nil
    flash[:color] = "Logout Successfull"
    redirect_to root_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_report
      @report = Report.find(params[:format])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :role)
    end

end
