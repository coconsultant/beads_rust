# frozen_string_literal: true

# Homebrew formula for br - Agent-first issue tracker
# Repository: https://github.com/Dicklesworthstone/beads_rust
#
# To install:
#   brew tap dicklesworthstone/tap
#   brew install br
#
# Or directly:
#   brew install dicklesworthstone/tap/br

class Br < Formula
  desc "Agent-first issue tracker (SQLite + JSONL)"
  homepage "https://github.com/Dicklesworthstone/beads_rust"
  license "MIT"
  version "0.1.31"

  on_macos do
    on_arm do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-v#{version}-darwin_arm64.tar.gz"
      sha256 "45a109a033cbf7677fe54525a12f76344df9f2a62238be421aebfc72b99269ac"
    end
    on_intel do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-v#{version}-darwin_amd64.tar.gz"
      sha256 "e5a31ead4f5b53c8c27bbfcfa972e4cc9d90a0687276532061dc1474885e7358"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-v#{version}-linux_arm64.tar.gz"
      sha256 "235e65c009b7064f3c9d68a6fc57806a399c6cbb783ca3bf9dc74db8652c732e"
    end
    on_intel do
      url "https://github.com/Dicklesworthstone/beads_rust/releases/download/v#{version}/br-v#{version}-linux_amd64.tar.gz"
      sha256 "364181c9d8d72f290ed8a9c1a6b2547ae943c6526a2862a09dcb82215cf57ada"
    end
  end

  def install
    bin.install "br"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/br --version")

    # Test basic functionality
    system bin/"br", "init"
    assert_predicate testpath/".beads", :directory?
    assert_predicate testpath/".beads/beads.db", :file?
  end
end
