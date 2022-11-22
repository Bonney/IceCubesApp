//
//  LoggedOutView.swift
//  IceCubesApp
//
//  Created by Matt Bonney on 11/21/22.
//

import SwiftUI

/// View to show when completely logged out/on fresh launch.
struct LoggedOutView: View {
    @State private var animateIn: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                background()
                    .animation(.none, value: animateIn)

                VStack(spacing: 24) {
                    icon()
                    title()
                }
                .animation(.spring().speed(0.75).delay(0.1), value: animateIn)
                .offset(y: animateIn ? 0 : -1000)
                .padding(.bottom, 24)
            }
            .overlay(alignment: .bottom) {
                buttons()
                    .animation(.spring().speed(0.75).delay(0.3), value: animateIn)
                    .offset(y: animateIn ? 0 : 1000)
            }
            .navigationDestination(for: String.self) { string in
                Text(string)
            }
            .onAppear {
                animateIn.toggle()
            }
        }
    }

    func background() -> some View {
        LinearGradient(colors: [.indigo, .cyan, .white], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }

    func icon() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)

            Image(systemName: "snowflake")
                .symbolRenderingMode(.monochrome)
                .font(.system(size: 120))
                .foregroundStyle(.thickMaterial)

        }
        .aspectRatio(1, contentMode: .fit)
        .frame(width: 180, height: 180, alignment: .center)
            .foregroundStyle(.ultraThinMaterial)
    }

    func title() -> some View {
        Text("IceCubes")
            .font(.system(size: 50))
            .fontWeight(.semibold)
            .fontWidth(.expanded)
            .foregroundStyle(.thickMaterial)
    }

    func buttons() -> some View {
        VStack {
            NavigationLink(value: "Create Account") {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
            }
            .tint(Color.white)
            .foregroundStyle(.cyan)

            NavigationLink(value: "Log In") {
                Text("Log In")
                    .frame(maxWidth: .infinity)
            }
            .tint(Color.cyan)

        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
    }
}

struct LoggedOutView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedOutView()
    }
}
