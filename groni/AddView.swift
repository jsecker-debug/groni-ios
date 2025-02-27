//
//  AddView.swift
//  groni
//

import SwiftUI

struct AddView: View {
    @State private var searchText = ""
    @State private var previousSearches = [
        "Dante NYC",
        "Bar Termini"
    ]
    @State private var isSearching = false
    @State private var scrollToID: String? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Search bar
            VStack(spacing: 12) {
                Text("Add Groni")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                
                Text("Search for a place or add a new one")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                // Search field
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search for a place", text: $searchText)
                        .font(.body)
                        .onTapGesture {
                            isSearching = true
                            scrollToID = "searchField"
                        }
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .id("searchField")
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                )
                .padding(.horizontal, 16)
                .padding(.top, 4)
                .padding(.bottom, 16)
            }
            .background(Color.white)
            
            // Content area
            ScrollViewReader { scrollProxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // Previous searches section
                        if !isSearching || searchText.isEmpty {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Previous Searches")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                                
                                VStack(spacing: 0) {
                                    ForEach(previousSearches, id: \.self) { search in
                                        Button(action: {
                                            searchText = search
                                            isSearching = true
                                        }) {
                                            HStack {
                                                Image(systemName: "clock")
                                                    .foregroundColor(.gray)
                                                    .frame(width: 24)
                                                
                                                Text(search)
                                                    .font(.body)
                                                    .foregroundColor(.primary)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 16)
                                            .background(Color.white)
                                        }
                                    }
                                }
                                .background(Color.white)
                            }
                            
                            // Divider between previous searches and results
                            Divider()
                                .padding(.top, 8)
                        }
                        
                        // Search results section
                        if isSearching && !searchText.isEmpty {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Results")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 16)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                                
                                // Sample results (would be replaced with actual search results)
                                VStack(spacing: 0) {
                                    ForEach(getFilteredResults(), id: \.self) { result in
                                        Button(action: {
                                            // Navigate to detail view for this result
                                        }) {
                                            HStack {
                                                Image(systemName: "mappin.circle.fill")
                                                    .foregroundColor(.orange)
                                                    .frame(width: 24)
                                                
                                                VStack(alignment: .leading, spacing: 2) {
                                                    Text(result)
                                                        .font(.body)
                                                        .foregroundColor(.primary)
                                                    
                                                    Text(getLocationForResult(result))
                                                        .font(.caption)
                                                        .foregroundColor(.gray)
                                                }
                                                
                                                Spacer()
                                                
                                                // Save button
                                                Button(action: {
                                                    // Save action
                                                }) {
                                                    Image(systemName: "bookmark")
                                                        .foregroundColor(.orange)
                                                }
                                                .padding(.horizontal, 8)
                                                
                                                // Add button
                                                Button(action: {
                                                    // Add action
                                                }) {
                                                    Image(systemName: "plus.circle")
                                                        .foregroundColor(.orange)
                                                }
                                                .padding(.horizontal, 8)
                                                
                                                Image(systemName: "chevron.right")
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 16)
                                            .background(Color.white)
                                        }
                                    }
                                }
                                .background(Color.white)
                                
                                // No results state
                                if getFilteredResults().isEmpty {
                                    VStack(spacing: 16) {
                                        Image(systemName: "magnifyingglass")
                                            .font(.largeTitle)
                                            .foregroundColor(.gray)
                                        
                                        Text("No results found")
                                            .font(.headline)
                                        
                                        Text("Try a different search term or add a new place")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .multilineTextAlignment(.center)
                                        
                                        Button(action: {
                                            // Action to add a new place
                                        }) {
                                            Text("Add New Place")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.vertical, 12)
                                                .padding(.horizontal, 24)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.orange)
                                                )
                                        }
                                        .padding(.top, 8)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 40)
                                }
                            }
                        }
                        
                        // Empty state when not searching
                        if !isSearching && searchText.isEmpty && previousSearches.isEmpty {
                            VStack(spacing: 16) {
                                Image(systemName: "magnifyingglass")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                                    .padding(.top, 60)
                                
                                Text("Search for a place")
                                    .font(.headline)
                                
                                Text("Find bars and restaurants to add your negroni experience")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 40)
                        }
                    }
                }
                .background(Color.gray.opacity(0.1))
                .onChange(of: scrollToID) { id in
                    if let id = id {
                        withAnimation {
                            scrollProxy.scrollTo(id, anchor: .top)
                        }
                        // Reset after scrolling
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            scrollToID = nil
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // Sample data for demonstration
    private func getFilteredResults() -> [String] {
        let allResults = [
            "Dante NYC",
            "Bar Termini",
            "Caffe Rivoire",
            "Bar Basso",
            "Clover Club",
            "Polpo",
            "Dante West Village"
        ]
        
        if searchText.isEmpty {
            return []
        }
        
        return allResults.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    private func getLocationForResult(_ result: String) -> String {
        let locations = [
            "Dante NYC": "New York, USA",
            "Bar Termini": "London, UK",
            "Caffe Rivoire": "Florence, Italy",
            "Bar Basso": "Milan, Italy",
            "Clover Club": "Brooklyn, USA",
            "Polpo": "London, UK",
            "Dante West Village": "New York, USA"
        ]
        
        return locations[result] ?? "Unknown location"
    }
}

#Preview {
    AddView()
}

