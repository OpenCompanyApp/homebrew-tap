class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.2/grok-0.3.2-macos-aarch64"
      sha256 "e145384685daa5febc9dbfa5c01b4b3d5a3cdbfe22af9bcfdb1be78e3b9410e4"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.2/grok-0.3.2-macos-x86_64"
      sha256 "610ffaf08d54c90e1c7c956eb4615090d40693c7c27543bae3d847ebdf936cb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.2/grok-0.3.2-linux-aarch64"
      sha256 "3d40c1040893ba2fa98ac3cf2c01e9a521689d4a4e8a532b9f079c50b00217b3"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.2/grok-0.3.2-linux-x86_64"
      sha256 "db1c2ca488013b2bbd728f233fc088137405becfc48b1771ab18623f35b3c462"
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
