cask "gitvelo" do
  version "0.7.0-beta.109"
  sha256 "bbfa7e971ded9763d1e4b5fd99b6e17196403c3b044f4039fc861f4f622be142"
  # GitVelo updates itself on standalone macOS builds. Declaring this lets
  # Homebrew compare the installed app bundle instead of the Caskroom record,
  # so an in-app update is not reported as outdated.
  auto_updates true

  url "https://github.com/chdaliu/git-velo-app/releases/download/v#{version}/gitvelo-#{version}-macos-universal.dmg"
  name "GitVelo"
  desc "Cross-platform Git GUI client"
  homepage "https://github.com/chdaliu/git-velo"

  depends_on macos: :monterey

  app "gitvelo.app"
  binary "#{appdir}/gitvelo.app/Contents/MacOS/gitvelo", target: "gitvelo"

  # The community builds are ad-hoc signed. Removing the quarantine attribute
  # keeps the first launch from being blocked by Gatekeeper.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/gitvelo.app"], must_succeed: false
  end

  zap trash: "~/.config/gitvelo"
end
