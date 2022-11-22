//
//  NewPostView.swift
//  IceCubesApp
//
//  Created by Matt Bonney on 11/21/22.
//

import SwiftUI
import Network

public struct NewPostView: View {
    let account: Account
    @State private var postContent: String = ""

    public init(account: Account) {
        self.account = account
    }

    public var body: some View {
        NavigationStack {
            Form {
                DemoView()
                Section {
                    HStack {
                        ProfileImage(account: account, size: 38)

                        VStack(alignment: .leading) {
                            Text(account.displayName)
                                .font(.headline)

                            Text(account.username)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                TextField("What's happening?", text: $postContent, axis: .vertical)
                    .lineLimit(10, reservesSpace: true)
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    SheetDismissButton(label: .cancel) {
                        // Cancellation actions?
                    }
                }

                ToolbarItem(placement: .primaryAction) {
                    publishButton()
                }

            }
            .safeAreaInset(edge: .bottom) {
                NewPostActions(post: "TODO")
                    .padding()
                    .background(.bar)
                    .overlay(alignment: .top) {
                        Divider()
                    }
            }
        }
    }

    func publishButton() -> some View {
        Button("Publish") {
            // Publish actions
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 12))
    }
}

/// Bottom section of a new post with buttons for photos, polls, etc.
struct NewPostActions: View {
    let post: String // Replace with Post object/model eventually

    var body: some View {
        HStack {
            primaryButtons()
                .buttonStyle(.borderless) // REQUIRED for multiple buttons in one List row.
                .labelStyle(.iconOnly)

            Spacer()

            Menu {
                Text("Menu Content.") // @TODO: Specific buttons for menu
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
        .font(.body)
        .fontWeight(.semibold)
        .tint(.secondary)
    }

    @ViewBuilder func primaryButtons() -> some View {
        Button {
            print("tapped PHOTO")
        } label: {
            Label("Photo", systemImage: "photo")
        }

        Spacer()

        Button {
            print("tapped POLL")
        } label: {
            Label("Poll", systemImage: "chart.bar.xaxis")
        }

        Spacer()

        Button {
            print("tapped LIKE")
        } label: {
            Label("Like", systemImage: "star")
        }

        Spacer()

        Button {
            print("tapped SHARE")
        } label: {
            Label("Share", systemImage: "square.and.arrow.up")
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(account: Account.preview)
            .tint(Color.indigo)

        Text("Showing sheet...")
            .foregroundStyle(.secondary)
        .sheet(isPresented: .constant(true)) {
            NewPostView(account: Account.preview)
                .tint(Color.indigo)
        }
    }
}
