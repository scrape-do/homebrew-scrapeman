cask "scrapeman" do
  version "0.6.1"

  on_arm do
    sha256 "564843994bfb5b1e4e1e2fb7b814e03c1522f20fac223bf7c9049bade5b65f46"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "66ca7d7828d8d6e484b3140a5e46f30bda6731aa17cc46494000928afc7b3c7c"
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
