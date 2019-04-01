RSpec.describe User, type: :model do
  let (:user) {FactoryBot.create :user}
  let (:activity) {FactoryBot.create :activity}
  subject {FactoryBot.create :user}

  context "associations" do
    it {is_expected.to have_one(:user_profile)}
    it do
      is_expected.to have_many(:active_relationships)
        .class_name(Relationship.name).dependent(:destroy)
          .with_foreign_key("follower_id")
    end
    it do
      is_expected.to have_many(:passive_relationships)
        .class_name(Relationship.name).dependent(:destroy)
          .with_foreign_key("followed_id")
    end
    it do
      is_expected.to have_many(:following).through(:active_relationships)
      .source(:followed)
    end
    it do
      is_expected.to have_many(:followers).through(:passive_relationships)
      .source(:follower)
    end
    it {is_expected.to have_many :markers}
    it {is_expected.to have_many :reviews}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :likes}
    it {is_expected.to have_many :activities}
    it {is_expected.to accept_nested_attributes_for :user_profile}
  end

  describe "#recent_activities" do
    it "return list users of result that match" do
      expect(user.recent_activities 5).to include activity
    end
  end
end
