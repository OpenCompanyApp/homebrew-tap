class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.19/grok-0.3.19-macos-aarch64"
      sha256 "cc3f95d2a1951b38f36b8e52ec4de39fcc8704e108355e8a016bb15bceef1789"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.19/grok-0.3.19-macos-x86_64"
      sha256 "3027138be540ff9b717726fb00c483bfc102843ece8c07b0bf97cfd68624d15c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.19/grok-0.3.19-linux-aarch64"
      sha256 "290192c9c874f6e1410451d971cf5c925898333bffc8284236b0a9cb956ff5bd"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.19/grok-0.3.19-linux-x86_64"
      sha256 "1c7b02c5a5cf79b1c61e20f443ee09597a93e60df184aee316798c6f985e8730"
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
