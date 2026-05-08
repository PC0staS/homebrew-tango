class Tango < Formula
  desc "Declarative API testing CLI"
  homepage "https://github.com/pc0stas/tango"
  url "https://github.com/pc0stas/tango/archive/v1.0.8.tar.gz"
  sha256 "451bd6ab5b6e612af6d5119d7db3a4161b0b3842398881926e7de0e4f00e154f"
  license "MIT"
  version "1.0.8"

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
