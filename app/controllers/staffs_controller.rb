class StaffsController < ApplicationController
  before_action :not_admin, except: [:login, :validate, :logout]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def login
    redirect_to orders_path if session[:staff] && session[:staff] != nil
  end

  def validate
		@staff = Staff.find_by(username: params[:username])
		if @staff && @staff.password == params[:password]
			session[:staff] = @staff.id
			session[:staff_username] = @staff.username
			redirect_to orders_path, notice: 'You have successfully logged in.'
		else
			redirect_to root_path, notice: 'Invalid login attempt.'
		end
  end

  def logout
    session.delete(:staff)
    session.delete(:staff_username)
    render 'login', notice: 'Successfully Logout'
  end

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:username, :password, :department_id)
    end
end
