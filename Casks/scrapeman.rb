cask "scrapeman" do
  version "0.6.3"

  on_arm do
    sha256 "37c58c3436932f6f9dfa8ab23b1d11d23235488bfb7218a2f7e8dd59b91aaaf8"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "dcca85a1cb89a77efd9b666fd57e64ffbee7926c0c9e9eee74f64a9bcf5a85fa"
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
