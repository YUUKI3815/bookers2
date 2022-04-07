class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @favorite_book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @favorite_book.id)
    favorite.save
  end

  def destroy
    @favorite_book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @favorite_book.id)
    favorite.destroy
  end
end
