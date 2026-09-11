class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.18/grok-0.3.18-macos-aarch64"
      sha256 "35abe49e8e04ddca087b0d7870b4a8f3cc03c7c5c15fa7f6fcf4a001dcdcc74f"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.18/grok-0.3.18-macos-x86_64"
      sha256 "136a964ccefd4ca2ee38c46c326350aef61ea87eebd7088dcbd5bf18a3ac9c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.18/grok-0.3.18-linux-aarch64"
      sha256 "6adec91cfbd1ccef200dba536aaf245722b9ffdfa7dd3b9ba1a9578990811a6f"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.18/grok-0.3.18-linux-x86_64"
      sha256 "865b075bfc1f2dfb6b06edab9bdb5a92cb608762d81b29c00298d9b5854d55df"
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
