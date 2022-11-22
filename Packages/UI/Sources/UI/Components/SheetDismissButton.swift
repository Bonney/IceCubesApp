//
//  SheetDismissButton.swift
//  IceCubesApp
//
//  Created by Matt Bonney on 11/21/22.
//

import SwiftUI

public enum SheetDismissLabel: String {
    case dismiss, cancel, done, xmark
}

/// Calls `dismiss` on the current environment, meant to dismiss sheets.
public struct SheetDismissButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var label: SheetDismissLabel

    /// optional additional action step
    var action: (() -> Void)?

    public init(label: SheetDismissLabel, action: ( () -> Void)? = nil) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(role: .cancel) {
            dismiss.callAsFunction()
            if let action {
                action()
            }
        } label: {
            buttonLabel()
        }
        .disabled(!presentationMode.wrappedValue.isPresented)
    }

    @ViewBuilder func buttonLabel() -> some View {
        switch label {
        case .xmark:
            Image(systemName: "xmark")
        case .dismiss, .cancel, .done:
            Text(label.rawValue.capitalized)
        }
    }
}

struct SheetDismissButton_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            SheetDismissButton(label: .done)

            SheetDismissButton(label: .cancel) {
                print("cancel")
            }

            SheetDismissButton(label: .xmark) {
                print("xmark tapped")
            }
        }
    }
}
