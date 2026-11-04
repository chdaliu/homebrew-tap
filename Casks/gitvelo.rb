cask "gitvelo" do
  version "0.7.0-beta.52"
  sha256 "b4e4e28a8d5890dcd9932e9b6b9ddf74fce53e9ec9f0870408a33bef5dd22d6c"
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
