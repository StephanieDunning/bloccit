require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
# #2
    it "responds to title" do
      expect(post).to respond_to(:title)
    end
# #3
    it "responds to body" do
      expect(post).to respond_to(:body)
    end
  end
end
