require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  describe 'GET index' do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns new Loan to @loan' do
      get :new
      expect(assigns(:loan)).to be_a_new(Loan)
    end
  end

  describe "POST #create" do
    let(:valid_data) { FactoryGirl.attributes_for(:loan) }

    it "redirect to loans#index" do
      post :create, params: { loan: valid_data }
      expect(response).to redirect_to(loan_path(Loan.last))
    end

    it "updates book status to borrowed" do
      post :create, params: { loan: valid_data }
      loan_book = Loan.last.book
      expect(loan_book.borrowed?).to be_truthy
    end
  end

  describe "GET #show" do
    let(:valid_data) { FactoryGirl.create(:loan) }

    it "returns http success" do
      get :show, params: { id: valid_data }
      expect(response).to have_http_status(:success)
    end

    it "render :show template" do
      get :show, params: { id: valid_data }
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #book_return" do
    let(:loan) { FactoryGirl.create(:loan) }

    it "redirects to loans#index" do
      delete :book_return, params: { id: loan.book }
      expect(response).to redirect_to(loans_path)
    end

    it "makes book available again" do
      expect(loan.book.borrowed?).to be_truthy
      
      delete :book_return, params: { id: loan.book }

      book = Book.find(loan.book.id)
      expect(book.available?).to be_truthy
    end
  end
end
