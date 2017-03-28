class HomeController < ApplicationController
  def index
    @books_all = Book.all.count
    @books_available = Book.available.count
    @books_borrowed = Book.borrowed.count

    @users_all = User.all.count
    @users_with_loans = User.with_loans.count
  end
end
