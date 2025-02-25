//
//  FeedView.swift
//  groni
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            Text("Feed")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FeedView()
}
