class Tango < Formula
  desc "Declarative API testing CLI"
  homepage "https://github.com/pc0stas/tango"
  url "https://github.com/pc0stas/tango/archive/v1.0.7.tar.gz"
  sha256 "86f69a461e30e7d167175dcb2616eec419750b7e3ac2f84a922e4add543bbb5e"
  license "MIT"
  version "1.0.7"

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
