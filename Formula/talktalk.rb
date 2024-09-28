class Talktalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.4/TalkTalk_macos_arm64.zip"
  sha256 "2f883bf78c765605474ebd13b1c416749cbbe6d7fc7d1df034380fb71077c060"
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
