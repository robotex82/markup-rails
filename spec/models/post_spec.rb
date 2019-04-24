require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(textile_with_pandoc: 'h1. Heading') }

  describe 'as pandoc JSON' do
    subject { post.textile_with_pandoc(:json) }

    it { expect(JSON.parse(subject)).to eq(
      [
        {"unMeta"=>{}},
        [
          {"c"=>[1, ["heading", [], []], [{"c"=>"Heading", "t"=>"Str"}]], "t"=>"Header"}
        ]
      ]
    ) }
  end
end