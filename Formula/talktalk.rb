class Talktalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.1/TalkTalk.zip"
  sha256 "150673aab001a9bf8466ac3e4e84b18056f0ab479b378bd9f8f1416c9b0d3215"
  license "BSD-3-Clause"

  def install
    bin.install "talk"
    libexec.install "TalkTalk_TalkTalkCore.bundle"

    # Create a wrapper script to set the environment variable for the bundle path
    (bin/"talk").write <<~EOS
      #!/bin/bash
      export TALKTALK_BUNDLE_PATH=#{libexec}/TalkTalk_TalkTalkCore.bundle
      exec "#{bin}/talk" "$@"
    EOS
  end
end
