import Foundation

public struct Status: Codable, Identifiable {
  public let id: String
  public let content: String
  public let account: Account
}

// MARK: Preview Content
public extension Status {
    static let preview: Status = Status(id: "0987654321", content: "This is my very special Mastodon post with lots of very insightful and thoughtful things to say. It even includes [this link to a website](https://www.apple.com), wow!", account: Account.preview)
}
