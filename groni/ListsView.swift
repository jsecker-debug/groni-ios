//
//  ListsView.swift

//  groni
//

import SwiftUI

struct ListsView: View {
    @State private var selectedTab = 0
    let tabs = ["Drunk", "To Drink", "Recs", "Groups"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header section
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
                    
                    // Tab section
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
                    
                    // Content based on selected tab
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
            }
        }
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
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 2,
                restaurantName: "Bar Termini",
                location: "London, UK",
                score: "9.2",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 3,
                restaurantName: "Caffe Rivoire",
                location: "Florence, Italy",
                score: "9.1",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 4,
                restaurantName: "Bar Basso",
                location: "Milan, Italy",
                score: "9.0",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 5,
                restaurantName: "Clover Club",
                location: "Brooklyn, USA",
                score: "8.9",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 6,
                restaurantName: "Polpo",
                location: "London, UK",
                score: "8.8",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 7,
                restaurantName: "Cafe Trussardi",
                location: "Milan, Italy",
                score: "8.7",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 8,
                restaurantName: "The Connaught Bar",
                location: "London, UK",
                score: "8.6",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 9,
                restaurantName: "Amor y Amargo",
                location: "New York, USA",
                score: "8.5",
                imageName: "fork.knife.circle.fill"
            )
            
            ListEntry(
                rank: 10,
                restaurantName: "Caffe Giacosa",
                location: "Florence, Italy",
                score: "8.4",
                imageName: "fork.knife.circle.fill"
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
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 2,
                restaurantName: "Connaught Bar",
                location: "London, UK",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 3,
                restaurantName: "Florería Atlántico",
                location: "Buenos Aires, Argentina",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 4,
                restaurantName: "Licorería Limantour",
                location: "Mexico City, Mexico",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 5,
                restaurantName: "Little Red Door",
                location: "Paris, France",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 6,
                restaurantName: "Jigger & Pony",
                location: "Singapore",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 7,
                restaurantName: "Handshake Speakeasy",
                location: "Mexico City, Mexico",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 8,
                restaurantName: "Katana Kitten",
                location: "New York, USA",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 9,
                restaurantName: "Himkok",
                location: "Oslo, Norway",
                imageName: "fork.knife.circle.fill"
            )
            
            ToDrinkListEntry(
                rank: 10,
                restaurantName: "BKK Social Club",
                location: "Bangkok, Thailand",
                imageName: "fork.knife.circle.fill"
            )
        }
        .background(Color.gray.opacity(0.1))
    }
    
    func recsTabView() -> some View {
        VStack {
            Text("Recommendations")
                .font(.headline)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
    
    func groupsTabView() -> some View {
        VStack {
            Text("Groups")
                .font(.headline)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    ListsView()
}

