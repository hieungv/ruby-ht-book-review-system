require "rails_helper"
RSpec.describe "Sessions" do
  let (:user){FactoryBot.create :user, email: "test@test.com",
    password: "password", password_confirmation: "password"}
  it "signs user in and out" do
    sign_in :user
    get root_path
    expect(response).to render_template(:index)

    sign_out :user
    get root_path
    expect(response).not_to render_template(:index)
  end
end
