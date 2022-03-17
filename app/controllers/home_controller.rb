class HomeController < ApplicationController
  def index
  	if current_user.present?
      nominees = Nominee.includes(:user).where("nominees.user_id = ?", current_user)
      @nominees = User.where(id: nominees.map(&:nominee_id)) if nominees.present?
      new_nominee = (nominees.map(&:nominee_id) << current_user.id)
      @account_holders = User.where("id NOT IN (?) ", new_nominee)
    end
  end
end
