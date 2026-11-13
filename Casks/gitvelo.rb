cask "gitvelo" do
  version "0.7.0-beta.77"
  sha256 "3286c0e5d1b94575f122eed0b9566877c6d9eb15e1552be29e44d59a45b6953a"
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
