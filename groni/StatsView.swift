//
//  StatsView.swift
//  groni
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Text("Stats")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    StatsView()
}

