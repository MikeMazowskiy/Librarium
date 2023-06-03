# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def update?
    true if user.present? && user.id == profile.user.id
  end

  private

  def profile
    record
  end
end

