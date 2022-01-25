class UnitController < ApplicationController
  before_action :require_signed_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]
  def index
    @units = Unit.all
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


  private
    def unit_params
      params.require(:unit).permit(:name, :description, :image, :big_desc)
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
