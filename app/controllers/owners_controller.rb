class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to "/owners/:id", notice: "You are now signed up to Seat Your Self!"
    else
      render "new"
  end
end

private
  def owner_params
    params.require(:owner).permit(:email, :password, :password_confirmation)
  end
end
