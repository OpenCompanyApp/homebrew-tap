class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.6/grok-0.3.6-macos-aarch64"
      sha256 "aa1f2aafc0911cacdeb371313df0bb7366b9ae16eefa245bee74da8ee7ac3816"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.6/grok-0.3.6-macos-x86_64"
      sha256 "c3e7d2ff1472ac6ecd5c7ce933ac49294c1b10bdfd5bd261fde94561f8a9607e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.6/grok-0.3.6-linux-aarch64"
      sha256 "5e586ef3f4c70df89aa224c7efa9c9cded5b007ab3f5228d5374abf9a1e99afc"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.6/grok-0.3.6-linux-x86_64"
      sha256 "abc088012e97183194ded3b14cb3d0ecf7af68b710b43c49e5e05ec382eabe9b"
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
