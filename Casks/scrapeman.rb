cask "scrapeman" do
  version "0.6.4"

  on_arm do
    sha256 "8a882ce26a34a1f095ecc2c984337fc51d0168b9d946d8ce5288fd7530e4ffbe"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "4c8191129d405967904b7f145f66483b75c0f16b9464769d2daa01186105c9fa"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-x64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  name "Scrapeman"
  desc "Open-source desktop API client built by Scrape.do"
  homepage "https://scrapeman.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Scrapeman.app"

  # Strip the quarantine xattr that Homebrew sets on every cask install
  # since it dropped --no-quarantine. Scrapeman is ad-hoc signed (Apple
  # Developer ID notarization is on the long-term roadmap) so without
  # this the user would see a Gatekeeper warning on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Scrapeman.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Scrapeman",
    "~/Library/Preferences/com.scrapeman.app.plist",
    "~/Library/Saved Application State/com.scrapeman.app.savedState",
    "~/Library/Logs/Scrapeman",
    "~/Library/Caches/Scrapeman",
    "~/Library/Caches/com.scrapeman.app",
  ]
end
