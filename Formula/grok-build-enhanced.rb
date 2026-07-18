class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.2.2"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.2/grok-0.2.2-macos-aarch64"
      sha256 "a36d44615efb326a4f326031d339fa797e8d0f3e2e9799e8cc317b86b6b38b12"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.2/grok-0.2.2-macos-x86_64"
      sha256 "9d28239db812f35c65a635dd49d4a262e3e35809a11c318df234e33c6df757c0"
    end
  end

  def install
    asset = Hardware::CPU.arm? ? "grok-#{version}-macos-aarch64" : "grok-#{version}-macos-x86_64"
    bin.install asset => "grok"
    chmod 0755, bin/"grok"
    bin.install_symlink "grok" => "agent"
  end

  test do
    assert_match "Grok Build Enhanced #{version}", shell_output("#{bin}/grok version")
  end
end
