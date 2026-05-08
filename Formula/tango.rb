class Tango < Formula
  desc "Declarative API testing CLI"
  homepage "https://github.com/pc0stas/tango"
  url "https://github.com/pc0stas/tango/archive/v1.0.9.tar.gz"
  sha256 "f64b91db5f295e908b36f2aeb6434c55594e7efa147d8d9007bf97780ec2de96"
  license "MIT"
  version "1.0.9"

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
