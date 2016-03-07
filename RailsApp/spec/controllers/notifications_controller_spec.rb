# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  title      :string
#  message    :string
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
