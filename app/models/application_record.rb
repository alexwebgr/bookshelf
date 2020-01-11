class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def digest
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(SecureRandom.urlsafe_base64, cost: cost)
  end

  def create_token
    self.token = digest
  end
end
