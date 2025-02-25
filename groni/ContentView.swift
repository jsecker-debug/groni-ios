//
//  ContentView.swift
//  groni
//
//  Created by Joshua Secker on 25/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "newspaper")
                }
            
            ListsView()
                .tabItem {
                    Label("Lists", systemImage: "list.bullet")
                }
            
            AddView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
