# frozen_string_literal: true

module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_admin_user, only: %i[show edit update destroy toggle]
    # after_action :verify_authorized, except: :index
    # after_action :verify_policy_scoped, only: :index

    # GET /admin/users or /admin/users.json
    def index
      authorize [:admin, User]
      @admin_users = policy_scope(
        User.includes(:role),
        policy_scope_class: Admin::UserPolicy::Scope
      ).all
    end

    # GET /admin/users/1 or /admin/users/1.json
    def show; end

    def toggle
      authorize [:admin, @admin_user]
      @admin_user.update(active: !@admin_user.active)

      respond_to { |format| format.json { head :no_content } }
    end

    # GET /admin/users/new
    def new
      @admin_user = User.new
      authorize [:admin, @admin_user]
    end

    # GET /admin/users/1/edit
    def edit
      authorize @admin_user, policy_class: Admin::UserPolicy
    end

    # POST /admin/users or /admin/users.json
    def create
      @admin_user = User.new(admin_user_params)
      authorize [:admin, @admin_user]

      if @admin_user.save
        redirect_to [:admin, @admin_user], notice: 'User was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /admin/users/1 or /admin/users/1.json
    def update
      authorize [:admin, @admin_user]
      if @admin_user.update(admin_user_params)
        redirect_to [:admin, @admin_user], notice: 'User was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /admin/users/1 or /admin/users/1.json
    def destroy
      authorize [:admin, @admin_user]
      @admin_user.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
