cask "gitvelo" do
  version "0.3.0"
  sha256 "fa965a86bf8de51ebe64da67aee93b0514ba35c5920031da94406d34d53993b1"

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
