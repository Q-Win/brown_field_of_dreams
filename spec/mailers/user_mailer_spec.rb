require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email_confirmation" do
    user = User.create(first_name: "Jawesome", last_name: "Sauce", password: "password", email: "email@example.com", )
    let(:mail) { UserMailer.email_confirmation(user, user.activation_token) }

    it "renders the headers" do
      expect(mail.subject).to eq("Email confirmation")
      expect(mail.to).to eq(["#{user.email}"])
      expect(mail.from).to eq(["invites@brownfield.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Click this link to confirm your email and activate your account.")
    end
  end

end
