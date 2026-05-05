class Tango < Formula
  desc "Declarative API testing CLI"
  homepage "https://github.com/pc0stas/tango"
  url "https://github.com/pc0stas/tango/archive/v1.0.4.tar.gz"
  sha256 "d59e5c93b1b5d558077ac1d2f139616d3f6ad4e73286c0839cbedaa9c9b95e2a"
  license "MIT"
  version "1.0.4"

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
