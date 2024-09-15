class TalkTalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.1/talk.zip"
  sha256 "0fe0956fd3c3c38dc96d7cfaec503df3b610e03f15fdf3b70f0763e291020b6a"
  license "BSD-3-Clause"

  def install
    bin.install "talk"
  end
end
