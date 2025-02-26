//
//  StatsView.swift
//  groni
//

import SwiftUI

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
    
    var body: some View {
        ScrollView {
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
                
                // Stats overview section
                VStack(spacing: 16) {
                    // Section header
                    HStack {
                        Text("Negroni Overview")
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
                    
                    // Additional stats sections could go here
                    
                    Spacer(minLength: 100)
                }
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .offset(y: -20)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
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

#Preview {
    StatsView()
}

