class PagesController < ApplicationController
	def home
		@subscriptions = Subscription.all
	end
end
