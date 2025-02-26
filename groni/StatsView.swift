//
//  StatsView.swift
//  groni
//

import SwiftUI
import MapKit
import Charts

struct StatsView: View {
    // Static user data
    let userName = "Joshua Secker"
    let userHandle = "@joshuasecker"
    let currentLevel = 39
    let nextLevel = 40
    let currentML = 26675
    let targetML = 28100
    let negronisConsumed = 452
    let placesTried = 218
    let favoriteNegroni = "Sbagliato"
    let groniStreak = "4 weeks"
    let placesSaved = 37
    let topCity = "Florence"
    let completionRate = "78%"
    
    // Tab selection state
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Profile header with background
            ZStack(alignment: .top) {
                // Background image (using a color for now)
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.orange.opacity(0.3)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(height: 200)
                
                VStack(spacing: 16) {
                    // User info
                    HStack(alignment: .center) {
                        // Profile image
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                            .padding(4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(userName)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(userHandle)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Spacer()
                        
                        // Action buttons
                        HStack(spacing: 12) {
                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: "person.2.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(.orange)
                                )
                            
                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: "trophy.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(.orange)
                                )
                            
                            Circle()
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(.orange)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Level progress section
                    HStack(spacing: 20) {
                        // Current level
                        VStack {
                            Text("Novice")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                            
                            HStack(alignment: .bottom, spacing: 2) {
                                Text("\(currentLevel)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "wineglass.fill")
                                    .foregroundColor(.blue)
                                    .font(.caption)
                            }
                        }
                        
                        // Progress bar
                        VStack(alignment: .leading, spacing: 4) {
                            // ML consumed / target
                            Text("\(currentML) ml / \(targetML) ml")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            // Progress bar
                            ZStack(alignment: .leading) {
                                // Background
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.3))
                                    .frame(height: 8)
                                
                                // Progress
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green)
                                    .frame(width: CGFloat(currentML) / CGFloat(targetML) * UIScreen.main.bounds.width * 0.5, height: 8)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        // Next level
                        VStack {
                            Text("Master")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                            
                            HStack(alignment: .bottom, spacing: 2) {
                                Text("\(nextLevel)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "wineglass.fill")
                                    .foregroundColor(.purple)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Content area with tabs
            ZStack(alignment: .top) {
                // White background with rounded corners
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
                
                // Content with custom tab selector at top
                VStack(spacing: 0) {
                    // Tab selector
                    HStack(spacing: 0) {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            VStack(spacing: 8) {
                                Text("Stats")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 0 ? .orange : .gray)
                                
                                // Underline for selected tab
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(selectedTab == 0 ? .orange : .clear)
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Button(action: {
                            selectedTab = 1
                        }) {
                            VStack(spacing: 8) {
                                Text("Leaderboards")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 1 ? .orange : .gray)
                                
                                // Underline for selected tab
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(selectedTab == 1 ? .orange : .clear)
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                    // Tab content
                    if selectedTab == 0 {
                        ScrollView {
                            statsTabView
                                .padding(.bottom, 100)
                        }
                    } else {
                        ScrollView {
                            leaderboardsTabView
                                .padding(.bottom, 100)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .offset(y: -20)
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // Stats Tab View
    var statsTabView: some View {
        VStack(spacing: 16) {
            // Section header
            HStack {
                Text("Groni Overview")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                Spacer()
            }
            
            // Stats cards carousel
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 12) {
                    // Card width calculation for consistent sizing
                    let cardWidth = UIScreen.main.bounds.width * 0.28
                    
                    // Negronis Drunk
                    statsCard(
                        icon: "wineglass.fill",
                        iconColor: .orange,
                        title: "Negronis Drunk",
                        value: "\(negronisConsumed)",
                        width: cardWidth
                    )
                    
                    // Places Tried
                    statsCard(
                        icon: "mappin.circle.fill",
                        iconColor: .blue,
                        title: "Places Tried",
                        value: "\(placesTried)",
                        width: cardWidth
                    )
                    
                    // Favorite Negroni
                    statsCard(
                        icon: "heart.fill",
                        iconColor: .red,
                        title: "Fav Groni",
                        value: favoriteNegroni,
                        width: cardWidth
                    )
                    
                    // Top City
                    statsCard(
                        icon: "building.2.fill",
                        iconColor: .purple,
                        title: "Top City",
                        value: topCity,
                        width: cardWidth
                    )
                    
                    // Completion Rate
                    statsCard(
                        icon: "checkmark.circle.fill",
                        iconColor: .green,
                        title: "Completion Rate",
                        value: completionRate,
                        width: cardWidth
                    )
                    
                    // Groni Streak
                    statsCard(
                        icon: "flame.fill",
                        iconColor: .orange,
                        title: "Groni Streak",
                        value: groniStreak,
                        width: cardWidth
                    )
                    
                    // Places Saved
                    statsCard(
                        icon: "bookmark.fill",
                        iconColor: .blue,
                        title: "Places Saved",
                        value: "\(placesSaved)",
                        width: cardWidth
                    )
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .frame(height: UIScreen.main.bounds.width * 0.28 + 48) // Card height + padding
            
            // World Map section
            VStack(spacing: 12) {
                // Section header
                HStack {
                    Text("Groni Distribution")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                
                // World Map
                WorldMapView()
                    .frame(height: 220)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
            }
            
            // Charts section
            VStack(spacing: 12) {
                // Section header
                HStack {
                    Text("Monthly Consumption")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                
                // Monthly consumption chart
                MonthlyConsumptionChart()
                    .frame(height: 220)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
            }
            
            // Friends section
            VStack(spacing: 12) {
                // Section header
                HStack {
                    Text("Gronis Shared")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                
                // Friends carousel
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 16) {
                        // Friend profiles sorted by count (most to least)
                        friendProfile(name: "@Michael12", count: 15, rank: 1)
                        friendProfile(name: "@JamesNYC", count: 12, rank: 2)
                        friendProfile(name: "@AvaLondon", count: 11, rank: 3)
                        friendProfile(name: "@Olivia_G", count: 9, rank: 4)
                        friendProfile(name: "@Emma_Drinks", count: 8, rank: 5)
                        friendProfile(name: "@Will_Cocktails", count: 7, rank: 6)
                        friendProfile(name: "@SophiaBar", count: 5, rank: 7)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .frame(height: 160)
                .padding(.bottom, 16)
            }
            
            // Rating Distribution section
            VStack(spacing: 12) {
                // Section header
                HStack {
                    Text("Rating Distribution")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    Spacer()
                }
                
                // Subtitle
                HStack {
                    Text("How you rate your negroni experiences")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                // Rating distribution chart
                RatingDistributionChart()
                    .frame(height: 220)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
            }
            
            Spacer(minLength: 100)
        }
        .background(Color.white)
    }
    
    // Leaderboards Tab View
    var leaderboardsTabView: some View {
        VStack(spacing: 16) {
            // Category selector buttons
            HStack(spacing: 8) {
                categoryButton(title: "Gronis", index: 0)
                categoryButton(title: "Places", index: 1)
                categoryButton(title: "Saved", index: 2)
                categoryButton(title: "Streak", index: 3)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            // Divider below buttons
            Divider()
                .padding(.top, 4)
            
            // Leaderboard content based on selected category
            if selectedLeaderboardCategory == 0 {
                groniLeaderboard
            } else if selectedLeaderboardCategory == 1 {
                placesLeaderboard
            } else if selectedLeaderboardCategory == 2 {
                savedLeaderboard
            } else {
                streakLeaderboard
            }
        }
        .background(Color.white)
    }
    
    // State for tracking selected leaderboard category
    @State private var selectedLeaderboardCategory = 0
    
    // Helper function to create category selector buttons
    func categoryButton(title: String, index: Int) -> some View {
        Button(action: {
            selectedLeaderboardCategory = index
        }) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                .background(selectedLeaderboardCategory == index ? Color.black : Color.gray.opacity(0.1))
                .foregroundColor(selectedLeaderboardCategory == index ? .white : .black)
                .cornerRadius(8)
        }
    }
    
    // Groni count leaderboard
    var groniLeaderboard: some View {
        VStack {
            ForEach(0..<10, id: \.self) { index in
                HStack {
                    // Rank number
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 30, alignment: .leading)
                    
                    // User avatar
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                        )
                    
                    // User name
                    Text(groniUsers[index].name)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    // Groni count
                    Text("\(groniUsers[index].count)")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(index % 2 == 0 ? Color.white : Color.gray.opacity(0.05))
                
                if index < 9 {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.white)
    }
    
    // Places visited leaderboard
    var placesLeaderboard: some View {
        VStack {
            ForEach(0..<10, id: \.self) { index in
                HStack {
                    // Rank number
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 30, alignment: .leading)
                    
                    // User avatar
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                        )
                    
                    // User name
                    Text(placesUsers[index].name)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    // Places count
                    Text("\(placesUsers[index].count)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(index % 2 == 0 ? Color.white : Color.gray.opacity(0.05))
                
                if index < 9 {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.white)
    }
    
    // Places saved leaderboard
    var savedLeaderboard: some View {
        VStack {
            ForEach(0..<10, id: \.self) { index in
                HStack {
                    // Rank number
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 30, alignment: .leading)
                    
                    // User avatar
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                        )
                    
                    // User name
                    Text(savedUsers[index].name)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    // Saved count
                    Text("\(savedUsers[index].count)")
                        .font(.headline)
                        .foregroundColor(.green)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(index % 2 == 0 ? Color.white : Color.gray.opacity(0.05))
                
                if index < 9 {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.white)
    }
    
    // Streak leaderboard
    var streakLeaderboard: some View {
        VStack {
            ForEach(0..<10, id: \.self) { index in
                HStack {
                    // Rank number
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 30, alignment: .leading)
                    
                    // User avatar
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                        )
                    
                    // User name
                    Text(streakUsers[index].name)
                        .font(.body)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    // Streak count
                    Text("\(streakUsers[index].streak)")
                        .font(.headline)
                        .foregroundColor(.red)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(index % 2 == 0 ? Color.white : Color.gray.opacity(0.05))
                
                if index < 9 {
                    Divider()
                        .padding(.horizontal)
                }
            }
        }
        .background(Color.white)
    }
    
    // Sample data for leaderboards
    let groniUsers = [
        (name: "@MichaelNYC", count: 782),
        (name: "@JamesLondon", count: 654),
        (name: "@SophiaRome", count: 621),
        (name: "@OliviaParis", count: 598),
        (name: "@EmmaTokyo", count: 567),
        (name: "@WilliamLA", count: 543),
        (name: "@AvaMilan", count: 521),
        (name: "@NoahBarcelona", count: 498),
        (name: "@IsabellaMadrid", count: 476),
        (name: "@LiamSydney", count: 452)
    ]
    
    let placesUsers = [
        (name: "@SophiaRome", count: 124),
        (name: "@NoahBarcelona", count: 118),
        (name: "@OliviaParis", count: 112),
        (name: "@JamesLondon", count: 105),
        (name: "@AvaMilan", count: 98),
        (name: "@MichaelNYC", count: 92),
        (name: "@IsabellaMadrid", count: 87),
        (name: "@WilliamLA", count: 82),
        (name: "@EmmaTokyo", count: 78),
        (name: "@LiamSydney", count: 73)
    ]
    
    let savedUsers = [
        (name: "@OliviaParis", count: 215),
        (name: "@JamesLondon", count: 198),
        (name: "@AvaMilan", count: 187),
        (name: "@MichaelNYC", count: 176),
        (name: "@SophiaRome", count: 165),
        (name: "@NoahBarcelona", count: 154),
        (name: "@WilliamLA", count: 143),
        (name: "@IsabellaMadrid", count: 132),
        (name: "@EmmaTokyo", count: 121),
        (name: "@LiamSydney", count: 110)
    ]
    
    let streakUsers = [
        (name: "@WilliamLA", streak: "52 weeks"),
        (name: "@MichaelNYC", streak: "48 weeks"),
        (name: "@SophiaRome", streak: "43 weeks"),
        (name: "@JamesLondon", streak: "39 weeks"),
        (name: "@OliviaParis", streak: "36 weeks"),
        (name: "@AvaMilan", streak: "32 weeks"),
        (name: "@NoahBarcelona", streak: "28 weeks"),
        (name: "@IsabellaMadrid", streak: "24 weeks"),
        (name: "@EmmaTokyo", streak: "21 weeks"),
        (name: "@LiamSydney", streak: "18 weeks")
    ]
    
    // Helper function to create stats cards
    func statsCard(icon: String, iconColor: Color, title: String, value: String, width: CGFloat) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(iconColor)
                .frame(height: 30)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(width: width, height: width) // Make cards square
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
    
    // Helper function to create friend profile cards
    func friendProfile(name: String, count: Int, rank: Int) -> some View {
        VStack(spacing: 6) {
            // Profile image
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 70, height: 70)
                .overlay(
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(18)
                        .foregroundColor(.gray)
                )
            
            // Groni count (larger and colored based on rank)
            Text("\(count)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(colorForRank(rank))
            
            // Name
            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        .frame(width: 90)
    }
    
    // Helper function to determine color based on rank
    func colorForRank(_ rank: Int) -> LinearGradient {
        switch rank {
        case 1:
            return LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        case 2:
            return LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
        case 3:
            return LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.6), Color.yellow.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        case 4, 5:
            return LinearGradient(
                gradient: Gradient(colors: [Color.yellow.opacity(0.8), Color.orange.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        default:
            return LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.8), Color.red.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}

// World Map View
struct WorldMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 140, longitudeDelta: 140)
    )
    
    // Sample negroni locations
    let locations = [
        NegroniLocation(name: "Dante NYC", coordinate: CLLocationCoordinate2D(latitude: 40.7295, longitude: -74.0004)),
        NegroniLocation(name: "Bar Termini", coordinate: CLLocationCoordinate2D(latitude: 51.5142, longitude: -0.1350)),
        NegroniLocation(name: "Caffe Rivoire", coordinate: CLLocationCoordinate2D(latitude: 43.7696, longitude: 11.2558)),
        NegroniLocation(name: "Bar Basso", coordinate: CLLocationCoordinate2D(latitude: 45.4654, longitude: 9.1859)),
        NegroniLocation(name: "Clover Club", coordinate: CLLocationCoordinate2D(latitude: 40.6782, longitude: -73.9442))
    ]
    
    var body: some View {
        Map(initialPosition: .region(region)) {
            ForEach(locations) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.orange)
            }
        }
        .overlay(
            Text("Your Groni Journey")
                .font(.caption)
                .padding(6)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
                .padding(8),
            alignment: .topLeading
        )
    }
}

// Model for map annotations
struct NegroniLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

// Extension to apply rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Custom shape for rounded corners
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// Monthly Consumption Chart View
struct MonthlyConsumptionChart: View {
    // Sample monthly data
    let monthlyData: [(month: String, count: Int)] = [
        ("Jan", 32),
        ("Feb", 28),
        ("Mar", 45),
        ("Apr", 37),
        ("May", 42),
        ("Jun", 50),
        ("Jul", 48),
        ("Aug", 55),
        ("Sep", 40),
        ("Oct", 38),
        ("Nov", 42),
        ("Dec", 35)
    ]
    
    // State to track which bar is being hovered/tapped
    @State private var selectedBarIndex: Int? = nil
    
    var body: some View {
        chartContent
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
    }
    
    // Extracted chart content to simplify the view hierarchy
    private var chartContent: some View {
        Chart {
            ForEach(monthlyData.indices, id: \.self) { index in
                let item = monthlyData[index]
                BarMark(
                    x: .value("Month", item.month),
                    y: .value("Gronis", item.count)
                )
                .foregroundStyle(Color.orange.gradient)
                .cornerRadius(6)
                .annotation(position: .top) {
                    if selectedBarIndex == index {
                        Text("\(item.count)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartXAxis {
            AxisMarks(values: .automatic)
        }
        .chartYScale(domain: 0...60) // Fixed Y-axis scale
        .frame(height: 180)
        .overlay(chartOverlay)
    }
    
    // Extracted chart overlay to further simplify
    private var chartOverlay: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            updateSelectedBar(at: value.location, in: geometry)
                        }
                        .onEnded { _ in
                            selectedBarIndex = nil
                        }
                )
        }
    }
    
    // Helper method to determine which bar is being interacted with
    private func updateSelectedBar(at location: CGPoint, in geometry: GeometryProxy) {
        let xPosition = location.x
        let plotWidth = geometry.size.width
        let stepWidth = plotWidth / CGFloat(monthlyData.count)
        let index = Int(xPosition / stepWidth)
        
        if index >= 0 && index < monthlyData.count {
            selectedBarIndex = index
        } else {
            selectedBarIndex = nil
        }
    }
}

// Rating Distribution Chart View
struct RatingDistributionChart: View {
    // Sample rating data (ratings from 1-10 and their frequency)
    let ratingData: [(rating: Int, count: Int)] = [
        (1, 2),
        (2, 3),
        (3, 5),
        (4, 8),
        (5, 12),
        (6, 18),
        (7, 42),
        (8, 78),
        (9, 65),
        (10, 32)
    ]
    
    // State to track which bar is being hovered/tapped
    @State private var selectedBarIndex: Int? = nil
    
    // Calculate the maximum count for fixed Y-axis scale
    private var maxCount: Int {
        ratingData.map { $0.count }.max() ?? 80
    }
    
    var body: some View {
        chartContent
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
    }
    
    // Extracted chart content to simplify the view hierarchy
    private var chartContent: some View {
        Chart {
            ForEach(ratingData.indices, id: \.self) { index in
                let item = ratingData[index]
                BarMark(
                    x: .value("Rating", "\(item.rating)"),
                    y: .value("Count", item.count)
                )
                .foregroundStyle(barColor(for: item.rating))
                .cornerRadius(6)
                .annotation(position: .top) {
                    if selectedBarIndex == index {
                        Text("\(item.count)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartXAxis {
            AxisMarks(values: .automatic)
        }
        .chartYScale(domain: 0...85) // Fixed Y-axis scale with some padding
        .frame(height: 180)
        .overlay(chartOverlay)
    }
    
    // Extracted chart overlay to further simplify
    private var chartOverlay: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            updateSelectedBar(at: value.location, in: geometry)
                        }
                        .onEnded { _ in
                            selectedBarIndex = nil
                        }
                )
        }
    }
    
    // Helper method to determine which bar is being interacted with
    private func updateSelectedBar(at location: CGPoint, in geometry: GeometryProxy) {
        let xPosition = location.x
        let plotWidth = geometry.size.width
        let stepWidth = plotWidth / CGFloat(ratingData.count)
        let index = Int(xPosition / stepWidth)
        
        if index >= 0 && index < ratingData.count {
            selectedBarIndex = index
        } else {
            selectedBarIndex = nil
        }
    }
    
    // Helper function to determine color based on rating
    private func barColor(for rating: Int) -> LinearGradient {
        switch rating {
        case 1...4:
            return LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.red.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        case 5...7:
            return LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        case 8...10:
            return LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        default:
            return LinearGradient(
                gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}

#Preview {
    StatsView()
}

