class Post < ApplicationRecord
  include ImageUploader::Attachment(:ketua)
  include ImageUploader::Attachment(:wakil)

  acts_as_votable

  def self.get_total_vote(date)
    beginning_date = date.to_date.beginning_of_day
    end_date       = date.to_date.end_of_day
    post_1 = Post.includes(:votes_for).first.votes_for.where(created_at: beginning_date..end_date).count
    post_2 = Post.includes(:votes_for).second.votes_for.where(created_at: beginning_date..end_date).count

    post_1 + post_2
  end
end
