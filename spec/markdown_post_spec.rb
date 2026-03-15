require 'spec_helper'
require 'fileutils'

describe Eksa::MarkdownPost do
  before(:all) do
    FileUtils.mkdir_p("_posts")
    File.write("_posts/2026-03-15-test-post.md", <<~MARKDOWN)
      ---
      title: "Test Post"
      date: 2026-03-15 10:00:00
      ---
      # Hello World
      This is a **test**.
    MARKDOWN
  end

  after(:all) do
    File.delete("_posts/2026-03-15-test-post.md") if File.exist?("_posts/2026-03-15-test-post.md")
  end

  it "loads metadata correctly" do
    post = Eksa::MarkdownPost.find("2026-03-15-test-post")
    expect(post.title).to eq("Test Post")
  end

  it "converts markdown to html" do
    post = Eksa::MarkdownPost.find("2026-03-15-test-post")
    expect(post.body_html).to include("<h1 id=\"hello-world\">Hello World</h1>")
    expect(post.body_html).to include("<strong>test</strong>")
  end
end
