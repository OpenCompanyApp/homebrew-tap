class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.14/grok-0.3.14-macos-aarch64"
      sha256 "df8e865a6a6bbb5c7f7f8dc19e904a01236733c9b17bcefa72a812a4c27d0f85"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.14/grok-0.3.14-macos-x86_64"
      sha256 "9a27541ddb4a3c9dfd14a83600d6a0d73fbcd0c02a8e2ef598728ea911e76c1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.14/grok-0.3.14-linux-aarch64"
      sha256 "55ddc9f4e1600840453826736f462d00f16ba7768fef5bc7c613ddb6952fd52f"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.14/grok-0.3.14-linux-x86_64"
      sha256 "71aedf8aef3f2ccc2673674fafd970f5334af18e742cfa5b6dd2936f73e382c8"
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
