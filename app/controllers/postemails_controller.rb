class PostemailsController < ApplicationController
   def index
    @postemails = Postemail.all
  end
end
