class Admin::RolesController < ApplicationController
  before_action :set_admin_role, only: %i[ show edit update destroy ]

  # GET /admin/roles or /admin/roles.json
  def index
    authorize [:admin, Role]
    @admin_roles = Role.all
  end

  # GET /admin/roles/1 or /admin/roles/1.json
  def show
  end

  # GET /admin/roles/new
  def new
    @admin_role = Role.new
    authorize [:admin, @admin_role]
  end

  # GET /admin/roles/1/edit
  def edit
    authorize @admin_role, policy_class: Admin::RolePolicy
  end

  # POST /admin/roles or /admin/roles.json
  def create
    @admin_role = Role.new(admin_role_params)
    authorize [:admin, @admin_role]

    respond_to do |format|
      if @admin_role.save
        format.html { redirect_to [:admin, @admin_role], notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @admin_role] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/roles/1 or /admin/roles/1.json
  def update
    authorize [:admin, @admin_role]
    respond_to do |format|
      if @admin_role.update(admin_role_params)
        format.html { redirect_to [:admin, @admin_role], notice: "Role was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @admin_role] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/roles/1 or /admin/roles/1.json
  def destroy
    authorize [:admin, @admin_role]
    @admin_role.destroy
    respond_to do |format|
      format.html { redirect_to admin_roles_url, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_role
    @admin_role = Role.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_role_params
    params.require(:role).permit(:name, :code)
  end
end
