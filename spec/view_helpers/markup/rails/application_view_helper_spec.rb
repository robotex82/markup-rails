require 'rails_helper'

RSpec.describe Markup::Rails::ApplicationViewHelper, type: :view_helper do
  context 'markdown' do
    let(:post) { Post.new(markdown: '# Heading') }
    let(:args) { [post, :markdown] }

    describe 'to_html' do
      it {  expect(rendered).to eq("<h1 id=\"heading\">Heading</h1>\n") }
    end
  end

  context 'textile' do
    let(:post) { Post.new(textile: 'h1. Heading') }
    let(:args) { [post, :textile] }

    describe 'to_html' do
      it {  expect(rendered).to eq("<h1>Heading</h1>") }
    end
  end

  context 'pandoc' do
    let(:post) { Post.new(textile_with_pandoc: 'h1. Heading') }
    let(:args) { [post, :textile_with_pandoc] }

    describe 'to_html' do
      it {  expect(rendered).to eq("<h1 id=\"heading\">Heading</h1>\n") }
    end
  end
end