class Talktalk < Formula
  desc "The TalkTalk programming language"
  homepage "https://github.com/talktalklang/talktalk"
  url "https://github.com/talktalklang/talktalk/releases/download/0.0.2/TalkTalk_macos_arm64.zip"
  sha256 "6011aa25df3b5fc8582c45547e5717c2d98b2d7a4713e82e7c05d2663bb5d62f"
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
