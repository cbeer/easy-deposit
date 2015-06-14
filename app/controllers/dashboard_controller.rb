class DashboardController < ApplicationController
  before_action :set_deposits, only: [:splash]

  def splash
  end

  private

  def set_deposits
    @deposits = Deposit.accessible_by(current_ability)
  end
end
