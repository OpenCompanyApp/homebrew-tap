class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.8/grok-0.3.8-macos-aarch64"
      sha256 "9558e1a4375dfcb0e1128679b638fe7c6cdc2b832710f97bbafa6739afeae396"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.8/grok-0.3.8-macos-x86_64"
      sha256 "616eda361e638ab2aa416575019376dcd411357bdf4635a40e82e9788aaffe3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.8/grok-0.3.8-linux-aarch64"
      sha256 "ff42c9c12e65ea39d68c46fd6e61588d66ae87e7801369e54ca839176573f53d"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.8/grok-0.3.8-linux-x86_64"
      sha256 "aa36d16a91d78e27f0c1bc99febcc6774d830cd783fc4e0245991e7dd794b880"
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
