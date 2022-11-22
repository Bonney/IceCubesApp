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
