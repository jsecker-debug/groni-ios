//
//  ListsView.swift

//  groni
//

import SwiftUI

struct ListsView: View {
    @State private var selectedTab = 0
    @State private var selectedPlace: String = ""
    @State private var showingPlaceView: Bool = false
    let tabs = ["Drunk", "To Drink", "Recs", "Groups"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header section - now outside ScrollView
                VStack(alignment: .leading, spacing: 4) {
                    Text("Top Negronis")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                    
                    Text("The best negronis around the world")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                .background(Color.white)
                
                // Tab section - now outside ScrollView
                VStack(spacing: 0) {
                    // Tab buttons
                    HStack(spacing: 0) {
                        ForEach(0..<tabs.count, id: \.self) { index in
                            Button(action: {
                                selectedTab = index
                            }) {
                                VStack(spacing: 8) {
                                    Text(tabs[index])
                                        .font(.subheadline)
                                        .fontWeight(selectedTab == index ? .semibold : .regular)
                                        .foregroundColor(selectedTab == index ? .orange : .gray)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                    
                                    // Underline for selected tab
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(selectedTab == index ? .orange : .clear)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    Divider()
                }
                .background(Color.white)
                
                // Content based on selected tab - only this part scrolls
                ScrollView {
                    if selectedTab == 0 {
                        drunkTabView()
                    } else if selectedTab == 1 {
                        toDrinkTabView()
                    } else if selectedTab == 2 {
                        recsTabView()
                    } else {
                        groupsTabView()
                    }
                }
                .background(Color.gray.opacity(0.1))
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $showingPlaceView) {
                PlaceView()
            }
        }
    }
    
    // Helper function to navigate to place view
    private func navigateToPlace(_ placeName: String) {
        selectedPlace = placeName
        showingPlaceView = true
    }
    
    // Tab content views
    func drunkTabView() -> some View {
        // List entries
        VStack(spacing: 1) {
            ListEntry(
                rank: 1,
                restaurantName: "Dante NYC",
                location: "New York, USA",
                score: "9.4",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Dante NYC") }
            )
            
            ListEntry(
                rank: 2,
                restaurantName: "Bar Termini",
                location: "London, UK",
                score: "9.2",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Bar Termini") }
            )
            
            ListEntry(
                rank: 3,
                restaurantName: "Caffe Rivoire",
                location: "Florence, Italy",
                score: "9.1",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Caffe Rivoire") }
            )
            
            ListEntry(
                rank: 4,
                restaurantName: "Bar Basso",
                location: "Milan, Italy",
                score: "9.0",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Bar Basso") }
            )
            
            ListEntry(
                rank: 5,
                restaurantName: "Clover Club",
                location: "Brooklyn, USA",
                score: "8.9",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Clover Club") }
            )
            
            ListEntry(
                rank: 6,
                restaurantName: "Polpo",
                location: "London, UK",
                score: "8.8",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Polpo") }
            )
            
            ListEntry(
                rank: 7,
                restaurantName: "Cafe Trussardi",
                location: "Milan, Italy",
                score: "8.7",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Cafe Trussardi") }
            )
            
            ListEntry(
                rank: 8,
                restaurantName: "The Connaught Bar",
                location: "London, UK",
                score: "8.6",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("The Connaught Bar") }
            )
            
            ListEntry(
                rank: 9,
                restaurantName: "Amor y Amargo",
                location: "New York, USA",
                score: "8.5",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Amor y Amargo") }
            )
            
            ListEntry(
                rank: 10,
                restaurantName: "Caffe Giacosa",
                location: "Florence, Italy",
                score: "8.4",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Caffe Giacosa") }
            )
        }
        .background(Color.gray.opacity(0.1))
    }
    
    func toDrinkTabView() -> some View {
        // List entries
        VStack(spacing: 1) {
            ToDrinkListEntry(
                rank: 1,
                restaurantName: "Paradiso",
                location: "Barcelona, Spain",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Paradiso") }
            )
            
            ToDrinkListEntry(
                rank: 2,
                restaurantName: "Connaught Bar",
                location: "London, UK",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Connaught Bar") }
            )
            
            ToDrinkListEntry(
                rank: 3,
                restaurantName: "Florería Atlántico",
                location: "Buenos Aires, Argentina",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Florería Atlántico") }
            )
            
            ToDrinkListEntry(
                rank: 4,
                restaurantName: "Licorería Limantour",
                location: "Mexico City, Mexico",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Licorería Limantour") }
            )
            
            ToDrinkListEntry(
                rank: 5,
                restaurantName: "Little Red Door",
                location: "Paris, France",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Little Red Door") }
            )
            
            ToDrinkListEntry(
                rank: 6,
                restaurantName: "Jigger & Pony",
                location: "Singapore",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Jigger & Pony") }
            )
            
            ToDrinkListEntry(
                rank: 7,
                restaurantName: "Handshake Speakeasy",
                location: "Mexico City, Mexico",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Handshake Speakeasy") }
            )
            
            ToDrinkListEntry(
                rank: 8,
                restaurantName: "Katana Kitten",
                location: "New York, USA",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Katana Kitten") }
            )
            
            ToDrinkListEntry(
                rank: 9,
                restaurantName: "Himkok",
                location: "Oslo, Norway",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Himkok") }
            )
            
            ToDrinkListEntry(
                rank: 10,
                restaurantName: "BKK Social Club",
                location: "Bangkok, Thailand",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("BKK Social Club") }
            )
        }
        .background(Color.gray.opacity(0.1))
    }
    
    func recsTabView() -> some View {
        // List entries
        VStack(spacing: 1) {
            RecsEntry(
                rank: 1,
                restaurantName: "Dante NYC",
                location: "New York, USA",
                score: "9.2",
                imageName: "fork.knife.circle.fill",
                onTapped: {
                    selectedPlace = "Dante NYC"
                    showingPlaceView = true
                }
            )
            
            RecsEntry(
                rank: 2,
                restaurantName: "Connaught Bar",
                location: "London, UK",
                score: "9.1",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Connaught Bar") }
            )
            
            RecsEntry(
                rank: 3,
                restaurantName: "Florería Atlántico",
                location: "Buenos Aires, Argentina",
                score: "8.9",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Florería Atlántico") }
            )
            
            RecsEntry(
                rank: 4,
                restaurantName: "Licorería Limantour",
                location: "Mexico City, Mexico",
                score: "8.8",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Licorería Limantour") }
            )
            
            RecsEntry(
                rank: 5,
                restaurantName: "Little Red Door",
                location: "Paris, France",
                score: "8.7",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Little Red Door") }
            )
            
            RecsEntry(
                rank: 6,
                restaurantName: "Jigger & Pony",
                location: "Singapore",
                score: "8.6",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Jigger & Pony") }
            )
            
            RecsEntry(
                rank: 7,
                restaurantName: "Handshake Speakeasy",
                location: "Mexico City, Mexico",
                score: "8.5",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Handshake Speakeasy") }
            )
            
            RecsEntry(
                rank: 8,
                restaurantName: "Katana Kitten",
                location: "New York, USA",
                score: "8.4",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Katana Kitten") }
            )
            
            RecsEntry(
                rank: 9,
                restaurantName: "Himkok",
                location: "Oslo, Norway",
                score: "8.3",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("Himkok") }
            )
            
            RecsEntry(
                rank: 10,
                restaurantName: "BKK Social Club",
                location: "Bangkok, Thailand",
                score: "8.2",
                imageName: "fork.knife.circle.fill",
                onTapped: { navigateToPlace("BKK Social Club") }
            )
        }
        .background(Color.gray.opacity(0.1))
    }
    
    func groupsTabView() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header with Add Group button
                HStack {
                    Text("Your Groups")
                        .font(.title)
                .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        // Add group action
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Friends section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Friends")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                    
                    Text("Groups with your friends")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 4)
                    
                    // Friend groups grid
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12)
                    ], spacing: 12) {
                        // Negroni Night group
                        GroupCard(
                            name: "Negroni Night",
                            members: 8,
                            newPosts: 3,
                            color: .orange.opacity(0.8),
                            onTapped: { navigateToPlace("Negroni Night") }
                        )
                        
                        // Cocktail Club group
                        GroupCard(
                            name: "Cocktail Club",
                            members: 12,
                            newPosts: 5,
                            color: .blue.opacity(0.7),
                            onTapped: { navigateToPlace("Cocktail Club") }
                        )
                    }
                    .padding(.horizontal, 16)
                }
                
                // Locations section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Locations")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                    
                    Text("Groups based on location")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 4)
                    
                    // Location groups grid
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12)
                    ], spacing: 12) {
                        // NYC group
                        GroupCard(
                            name: "NYC",
                            members: 42,
                            newPosts: 7,
                            color: .red.opacity(0.7),
                            onTapped: { navigateToPlace("NYC") }
                        )
                        
                        // London group
                        GroupCard(
                            name: "London",
                            members: 36,
                            newPosts: 4,
                            color: .purple.opacity(0.7),
                            onTapped: { navigateToPlace("London") }
                        )
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer(minLength: 80) // Space for tab bar
            }
        }
        .background(Color.white)
    }
}

#Preview {
    ListsView()
}

