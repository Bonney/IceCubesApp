//
//  StatusListRow.swift
//  IceCubesApp
//
//  Created by Matt Bonney on 11/21/22.
//

import SwiftUI
import Network

/// A view for displaying a "status" post in a List.
struct StatusListRow: View {
    let status: Status

    var body: some View {
        VStack {
            StatusListHeader(status: status)
            StatusListContent(status: status)
            StatusListActions(status: status)
        }
    }
}

/// Top section of a status post in a list. User image, name, timestamp.
struct StatusListHeader: View {
    let status: Status

    var body: some View {
        HStack(alignment: .top) {
            ProfileImage(account: status.account, size: 40)
            accountLabel(for: status.account)
        }
    }

    /// Stacked display name and username
    func accountLabel(for account: Account) -> some View {
        VStack(alignment: .leading, spacing: nil) {
            HStack {
                Text(account.displayName)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                timeOffsetLabel(for: status)
                    .foregroundStyle(.secondary)
            }
            .font(.subheadline)

            Text(account.acct)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    /// Creates a label such as "15m", "2d", "3mo".
    func timeOffsetLabel(for status: Status) -> some View {
        // @TODO: Need Status.timestamp
        Text("3h")
    }
}

/// Middle section of a status post in a list. Content of the post: text, images, links, etc.
struct StatusListContent: View {
    let status: Status


    var body: some View {
        Text(
            // Workaround to get markdown links working. We're probably not going to do this in production.
            LocalizedStringKey(status.content)
        )
            .font(.body)
            .foregroundStyle(.primary)
    }
}

/// Bottom section of a status post in a list. Buttons reply, like, etc.
struct StatusListActions: View {
    let status: Status

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
            print("tapped REPLY")
        } label: {
            Label("Reply", systemImage: "bubble.left.and.bubble.right")
        }

        Spacer()

        Button {
            print("tapped RE-POST")
        } label: {
            Label("Repost", systemImage: "arrow.2.squarepath")
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



struct StatusListRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            StatusListRow(status: Status.preview)
            StatusListRow(status: Status.preview)
            StatusListRow(status: Status.preview)
        }
    }
}
