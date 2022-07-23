class FactoriesController < ApplicationController
  def level_up
    return head(:forbidden) unless user_signed_in?

    mining_resource = params["mining_resource"]
    current_user.upgrade_iron if mining_resource == "iron"

    redirect_to root_url
  end
end
