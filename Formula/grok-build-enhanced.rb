class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.3/grok-0.3.3-macos-aarch64"
      sha256 "0e66725a3f302ee763c6feebb0374439614c8d7491b92b0d7af40901ab54e8ad"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.3/grok-0.3.3-macos-x86_64"
      sha256 "c857a35ccae0125470e6cb808e4a0a954e74389eb1bfb1646fcec55eeedcebd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.3/grok-0.3.3-linux-aarch64"
      sha256 "b1c00c5c60de9509027c070a0c41d44e106719c04f281ffd67e5726a5e2dc493"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.3/grok-0.3.3-linux-x86_64"
      sha256 "2b1340889a51ed8551963141043207b9b5bd295b095a7dbfc464d25ec384db9a"
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
