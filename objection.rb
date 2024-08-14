class Objection < Formula
  desc "Build server-first, highly-interactive, and beautiful web applications in Rust"
  homepage "https://github.com/radical-ui/objection"
  url "https://github.com/radical-ui/objection/archive/refs/tags/0.7.0.tar.gz"
  version "0.7.0"
  sha256 "b56144346e9a20614a0b6e5bbf51b083ac7594fce6d656ba83cdbf2b6db392e3"
  license "MIT"

  depends_on "rust" => :build

  def install
    ENV["CARGO_NET_GIT_FETCH_WITH_CLI"] = "true"
    system "cargo", "build", "--release", "--bin", "objection"
    bin.install "target/release/objection"
  end

  test do
    output = shell_output("#{bin}/objection --version")
    assert_match "objection_cli 0.7.0", output
  end
end
