cask "gitvelo" do
  version "0.1.0"
  sha256 "be26e9650ca6aa7d983d7cc71bf008dcfb4b10395fe6caa028a83ecfffb6069d"

  url "https://github.com/chdaliu/git-velo-app/releases/download/v#{version}/gitvelo-#{version}-macos-universal.dmg"
  name "GitVelo"
  desc "Cross-platform Git GUI client"
  homepage "https://github.com/chdaliu/git-velo"

  depends_on macos: ">= :monterey"

  app "gitvelo.app"
  binary "#{appdir}/gitvelo.app/Contents/MacOS/gitvelo", target: "gitvelo"

  # The community builds are ad-hoc signed. Removing the quarantine attribute
  # keeps the first launch from being blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/gitvelo.app"], must_succeed: false
  end

  zap trash: "~/.config/gitvelo"
end
