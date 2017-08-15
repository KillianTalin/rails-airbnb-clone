class BookmarksController < ApplicationController
  def index
    @bookmarks_guest = Bookmark.where(user: current_user)
    @bookmarks_host = Chalet.where(user: current_user).bookmarks
  end

  def new
    @bookmark = Bookmark.new

  end

  def create

  end
end
