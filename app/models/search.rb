class Search < ApplicationRecord
  def profiles
    @profiles ||= fetch_profiles
  end

  private

  def fetch_profiles
    profiles = Profile.order(:name)
    profiles = profiles.where("name iLike ?", "%#{keywords}%") if keywords.present?
    profiles = profiles.where("location iLike ?", "%#{location}%") if location.present?
    profiles = profiles.where("investor_type iLike ?", "%#{role}%") if role.present?
    profiles = profiles.where("mininvest >= ?", min_invest) if min_invest.present?
    profiles = profiles.where("maxinvest <= ?", max_invest) if max_invest.present?
    profiles
  end
end
