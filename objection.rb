class Objection < Formula
  desc "Build server-first, highly-interactive, and beautiful web applications in Rust"
  homepage "https://github.com/radical-ui/objection"
  url "https://github.com/radical-ui/objection/archive/refs/tags/0.7.1.tar.gz"
  version "0.7.1"
  sha256 "e08e73db5fe1c0af68b2c34b5fd78a52349bceb8a95ff48637452b6798031034"
  license "MIT"

  depends_on "rust" => :build

  def install
    ENV["CARGO_NET_GIT_FETCH_WITH_CLI"] = "true"
    system "cargo", "build", "--release", "--bin", "objection"
    bin.install "target/release/objection"
  end

  test do
    output = shell_output("#{bin}/objection --version")
    assert_match "objection_cli 0.7.1", output
  end
end
