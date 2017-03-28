class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :update]
  before_action :set_available_books, only: [:new, :show, :update]

  def new
    @loan = Loan.new
    @users = User.all
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      redirect_to loan_path(@loan) if @loan.book.borrowed! # change status
      flash[:notice] = "Loan has been successfuly created"
    else
      flash[:alert] = "Loan has not been created"
    end
  end

  def show
  end

  def update
    @user = @loan.user
    params[:loan]["user_id"] = @user.id
    @loan = Loan.new(loan_params)


    if @loan.save
      redirect_to loan_path(@loan) if @loan.book.borrowed! # change status
      flash[:notice] = "Loan has been successfuly updated"
    else
      binding.pry
      flash[:alert] = "Loan has not been updated"
    end
  end

  def book_borrow
  end

  def book_return
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_available_books
    @books = Book.available
  end

  def loan_params
    params.require(:loan).permit(:user_id, :book_id)
  end
end
