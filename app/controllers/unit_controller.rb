class UnitController < ApplicationController
  before_action :require_signed_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    @units = Unit.paginate(page: params[:page], per_page: 9)
  end
  def new
    @unit = Unit.new
  end
  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      flash[:notice] = "Unit created successfully"
      redirect_to unit_index_path
    else
      flash[:alert] = "Unit not created"
      render 'new'
    end
  end
  def show
    @unit = Unit.find(params[:id])
  end
  def edit
    @unit = Unit.find(params[:id])
  end
  def update
    @unit = Unit.find(params[:id])
    if @unit.update(unit_params)
      flash[:notice] = "Unit updated successfully"
      redirect_to unit_index_path
    else
      flash[:alert] = "Unit not updated"
      render 'edit'
    end
  end
  def destroy
    @unit = Unit.find(params[:id])
    if @unit.destroy
      flash[:notice] = "Unit deleted successfully"
      redirect_to unit_index_path
    else
      flash[:alert] = "Unit not deleted"
      render 'index'
    end
  end

  private
    def unit_params
      params.require(:unit).permit(:name, :description, :image, :big_desc, :address, :leader, :legal_phone, :leader_phone)
    end

  def require_signed_user
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
  def require_admin
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that"
      redirect_to root_path
    end
  end

end
