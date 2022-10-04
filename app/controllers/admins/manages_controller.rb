class Admins::ManagesController < ApplicationController
  before_action :set_admins_manage, only: %i[ show edit update destroy ]

  # GET /admins/manages or /admins/manages.json
  def index
    @admins_manages = Admins::Manage.all
  end

  # GET /admins/manages/1 or /admins/manages/1.json
  def show
  end

  # GET /admins/manages/new
  def new
    @admins_manage = Admins::Manage.new
  end

  # GET /admins/manages/1/edit
  def edit
  end

  # POST /admins/manages or /admins/manages.json
  def create
    @admins_manage = Admins::Manage.new(admins_manage_params)

    respond_to do |format|
      if @admins_manage.save
        format.html { redirect_to admins_manage_url(@admins_manage), notice: "Manage was successfully created." }
        format.json { render :show, status: :created, location: @admins_manage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/manages/1 or /admins/manages/1.json
  def update
    respond_to do |format|
      if @admins_manage.update(admins_manage_params)
        format.html { redirect_to admins_manage_url(@admins_manage), notice: "Manage was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_manage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_manage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/manages/1 or /admins/manages/1.json
  def destroy
    @admins_manage.destroy

    respond_to do |format|
      format.html { redirect_to admins_manages_url, notice: "Manage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_manage
      @admins_manage = Admins::Manage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_manage_params
      params.fetch(:admins_manage, {})
    end
end
