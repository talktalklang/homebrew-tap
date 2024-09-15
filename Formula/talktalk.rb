class Talktalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.1/TalkTalk.zip"
  sha256 "150673aab001a9bf8466ac3e4e84b18056f0ab479b378bd9f8f1416c9b0d3215"
  license "BSD-3-Clause"

  def install
    # Install the talk executable into libexec
    libexec.install "talk"

    # Install the resource bundle into libexec as well
    libexec.install "TalkTalk_TalkTalkCore.bundle"
  
    # Create a wrapper script in bin that points to the talk executable in libexec
    (bin/"talk").write <<~EOS
      #!/bin/bash
      export TALK_BUNDLE_PATH=#{libexec}/TalkTalk_TalkTalkCore.bundle
      exec "#{libexec}/talk" "$@"
    EOS

    # Ensure the wrapper script is executable
    chmod "+x", bin/"talk"
  end
end
