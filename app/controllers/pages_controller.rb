class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @booking = Booking.new
    @chalet = Chalet.new
    @selection_mont_blanc = Chalet.where(location: "Massif du Mont-Blanc").limit(3)
    @selection_beaufortain = Chalet.where(location: "Massif du Beaufortain").limit(3)
  end
end


# Note pour reviews:
# <% if @review.errors.any? %>
#   document.getElementById('new_review').innerHTML = "<%= j render 'reviews/form, restaurant: @restaurant, review: @review %>"
#<% else %>
# const new_review = "<%= j render 'reviews/show, review: @review %>"
# document.getElementById('reviews').insertAdjacentHTML('beforeend', new_review);
#<% end %>

