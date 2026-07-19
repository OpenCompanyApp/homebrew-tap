class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.3/grok-0.2.3-macos-aarch64"
      sha256 "25dd615cea07747acd641f64ce15c63ddd583ade8236e2c83413ff028ee65f4d"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.3/grok-0.2.3-macos-x86_64"
      sha256 "0b68bf059a00b8212e47d9e6b6a7987efaf1ab57a28fce869db1e31f7b11a2d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.3/grok-0.2.3-linux-aarch64"
      sha256 "0b39658380f6234c69c24e62879101feb828a95481b810a538c6f70c321ecf51"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.3/grok-0.2.3-linux-x86_64"
      sha256 "d1935601b59d251cec72147131cd0d0cf8be463bd0576e701266feb0ba8dddac"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    asset = "grok-#{version}-#{os}-#{arch}"
    bin.install asset => "grok"
    chmod 0755, bin/"grok"
    bin.install_symlink "grok" => "agent"
  end

  test do
    assert_match "Grok Build Enhanced #{version}", shell_output("#{bin}/grok version")
  end
end
