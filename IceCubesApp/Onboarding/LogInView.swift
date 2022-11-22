//
//  LogInView.swift
//  IceCubesApp
//
//  Created by Matt Bonney on 11/21/22.
//

import SwiftUI

struct TEMP_Server: Identifiable {
    var id: String { self.name }
    let name: String
    init(_ name: String) {
        self.name = name
    }
}

class LogInController: ObservableObject {
    @Published var servers: [TEMP_Server] = [TEMP_Server("mastodon.social"), TEMP_Server("mastodon.tech")]
    @Published var searchTerms: String = ""

    var filteredServers: [TEMP_Server] {
        if searchTerms == "" {
            return servers
        } else {
            return servers.filter {
                $0.name.localizedCaseInsensitiveContains(searchTerms)
            }
        }
    }
}

struct LogInView: View {
    @ObservedObject var controller: LogInController

    var body: some View {
        List {
            rows()
//            Text("Search to find the server you created your account on.")
//                .multilineTextAlignment(.center)
//                .foregroundStyle(.secondary)
//                .listRowBackground(Color.clear)
        }
        .searchable(text: $controller.searchTerms, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search for Your Server"))
//        .searchSuggestions {
//            rows()
//        }
        .navigationTitle("Welcome Back")
    }

    func rows() -> some View {
        ForEach(controller.filteredServers) { suggestedServer in
            Text(suggestedServer.name)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LogInView(controller: LogInController())
        }
    }
}
