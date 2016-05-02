class VotesController < ApplicationController
  before_action :require_sign_in

  def up_vote
    update_vote(1)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def down_vote
    update_vote(-1)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def update_vote(new_value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
    puts ">>>>>>>>>>>>>>>>>>> VOTES: #{@post.votes.where(user_id: current_user.id).count}"

    if @vote
      puts ">>>>>>>>>>>>>>>>>>>>>> updating existing vote"
      @vote.update_attribute(:value, new_value)
    else
      puts ">>>>>>>>>>>>>>>>>>>>>> created new vote"
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
  end
end
