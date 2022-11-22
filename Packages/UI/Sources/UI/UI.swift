import SwiftUI

public struct DemoView: View {
    public init() { }
    public var body: some View {
        Text("Demo")
            .padding()
            .background(Color.blue, in: Capsule())
    }
}

public struct UI {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}
