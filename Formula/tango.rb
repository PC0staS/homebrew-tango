class Tango < Formula
  desc "Declarative API testing CLI"
  homepage "https://github.com/pc0stas/tango"
  url "https://github.com/pc0stas/tango/archive/v1.0.0.tar.gz"
  sha256 "bbc5a0c0f9b0a971e9fa5a4db9392e3b66b619dc182747ff7312733fa073b2aa"
  license "MIT"
  version "1.0.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.Version=#{version}", "-o", "tango", "."
    bin.install "tango"
    generate_completions_from_executable(bin/"tango", "completion")
  end

  test do
    system "#{bin}/tango", "--version"
  end
end
