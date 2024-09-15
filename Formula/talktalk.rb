class Talktalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.1/TalkTalk.zip"
  sha256 "4cecb5c4d4988079a0d7fb3099c757306f7a6435ea9c4dd544d452b7b75742a9"
  license "BSD-3-Clause"

  def install
    bin.install "talk"
    prefix.install "TalkTalk_TalkTalkCore.bundle"
  end
end
