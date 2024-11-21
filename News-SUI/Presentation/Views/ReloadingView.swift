//
//  ReloadingRowView.swift
//  News-SUI
//
//  Created by KsArT on 21.11.2024.
//

import SwiftUI

struct ReloadingView: View {
    @Binding var state: ReloadingState
    let reloading: () -> Void
    
    var body: some View {
        VStack {
            switch state {
            case .none:
                EmptyView()
            case .reload:
                Color.clear
                    .task {
                        reloading()
                    }
            case .loading:
                VStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(maxWidth: .infinity)
            case .error(let message):
                HStack {
                    Text(message)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: 500)
                    Spacer()
                    Button {
                        reloading()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title)
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
    }
}

#Preview {
    VStack {
        List {
            ReloadingView(state: .constant(.loading)) {}
        }
    }
}
