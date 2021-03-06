require "rails_helper"
RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to belong_to(:user) }
end
