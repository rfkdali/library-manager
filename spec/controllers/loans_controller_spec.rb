require 'rails_helper'

RSpec.describe LoansController, type: :controller do

  describe "GET #book_borrow" do
    it "returns http success" do
      get :book_borrow
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #book_return" do
    it "returns http success" do
      get :book_return
      expect(response).to have_http_status(:success)
    end
  end

end
