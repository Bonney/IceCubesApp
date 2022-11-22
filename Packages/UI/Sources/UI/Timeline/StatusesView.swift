//
//  StatusesView.swift
//  
//
//  Created by Matt Bonney on 11/22/22.
//

import SwiftUI
import Network

public struct StatusesView: View {
    @EnvironmentObject private var client: Client
    @State private var loadedStatuses: [Status] = []
    @State private var error: Error? = nil

    public init() {
    }

    public var body: some View {
        List {
            if let error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
            }
            if loadedStatuses.isEmpty {
                emptyState()
            } else {
                loadedState()
            }
        }
        .navigationDestination(for: Account.self) { account in
            UserAccountView(account: account)
        }
        .navigationTitle("Timeline")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await refreshTimeline()
        }
        .refreshable {
            await refreshTimeline()
        }
    }

    func emptyState() -> some View {
        ProgressView()
    }

    func loadedState() -> some View {
        ForEach(loadedStatuses) { status in
            NavigationLink(value: status.account) {
                StatusListRow(status: status)
            }
        }
    }

    private func refreshTimeline() async {
        do {
            self.loadedStatuses = try await client.fetchArray(endpoint: Timeline.pub)
        } catch let error {
            print(error.localizedDescription)
            self.error = error
        }
    }
}

struct StatusesView_Previews: PreviewProvider {
    static var previews: some View {
        StatusesView()
            .environmentObject(Client(server: "mastodon.social"))
    }
}
