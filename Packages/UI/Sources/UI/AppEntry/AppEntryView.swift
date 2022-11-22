//
//  SwiftUIView.swift
//  
//
//  Created by Matt Bonney on 11/22/22.
//

import SwiftUI
import Network

public struct AppEntryView: View {
    @EnvironmentObject private var client: Client
    public init() { }

    public var body: some View {
        TabView {

            NavigationStack {
                StatusesView()
            }
            .tabItem {
                Label("Timeline", systemImage: "house")
            }

            NavigationStack {
                Text("Search View")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationStack {
                Text("Notifications View")
            }
            .tabItem {
                Label("Notifications", systemImage: "bell")
            }

            NavigationStack {
                UserAccountView(account: Account.preview)
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }

        }
        .environmentObject(client)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
            .environmentObject(Client(server: "mastodon.social"))
    }
}
