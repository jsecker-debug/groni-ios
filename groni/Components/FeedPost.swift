import SwiftUI

struct FeedPost: View {
    // Placeholder variables
    var username: String = "joshuasecker"
    var placeName: String = "Dante NYC"
    var location: String = "New York, USA"
    var rating: Double = 8.7
    var imageURL: String = "placeholder"
    var likes: Int = 42
    var comments: Int = 8
    var date: String = "2 hours ago"
    var isLiked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header: Username drank at PlaceName
            HStack(spacing: 4) {
                // Profile picture
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    )
                
                // Username and place
                Text(username)
                    .fontWeight(.semibold) +
                Text(" drank at ") +
                Text(placeName)
                    .fontWeight(.semibold)
                
                Spacer()
                
                // More options button
                Button(action: {
                    // More options action
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            // Main image
            ZStack(alignment: .topTrailing) {
                // Image placeholder
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.orange.opacity(0.3)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .aspectRatio(4/3, contentMode: .fit)
                    .overlay(
                        Image(systemName: "wineglass.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white.opacity(0.8))
                    )
                
                // Rating badge
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(ratingColor(rating))
                }
                .padding(16)
            }
            
            // Location and date
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                
                Text(location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 8)
            
            // Divider
            Divider()
                .padding(.horizontal, 16)
            
            // Action buttons
            HStack(spacing: 24) {
                // Like button
                Button(action: {
                    // Like action
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .gray)
                        
                        Text("\(likes)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Comment button
                Button(action: {
                    // Comment action
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "bubble.right")
                            .foregroundColor(.gray)
                        
                        Text("\(comments)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Share button
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Save button
                Button(action: {
                    // Save action
                }) {
                    Image(systemName: "bookmark")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    // Helper function to determine color based on rating
    private func ratingColor(_ rating: Double) -> Color {
        switch rating {
        case 0..<6:
            return .red
        case 6..<7.5:
            return .orange
        case 7.5..<9:
            return .green
        case 9...10:
            return Color(red: 0, green: 0.7, blue: 0.3) // Bright green
        default:
            return .gray
        }
    }
}

struct FeedPost_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                FeedPost(
                    username: "joshuasecker",
                    placeName: "Dante NYC",
                    location: "New York, USA",
                    rating: 8.7,
                    likes: 42,
                    comments: 8,
                    date: "2 hours ago"
                )
                
                FeedPost(
                    username: "emilywilson",
                    placeName: "Bar Termini",
                    location: "London, UK",
                    rating: 9.2,
                    likes: 87,
                    comments: 14,
                    date: "Yesterday"
                )
                
                FeedPost(
                    username: "michaelchen",
                    placeName: "Caffe Rivoire",
                    location: "Florence, Italy",
                    rating: 7.8,
                    likes: 31,
                    comments: 5,
                    date: "3 days ago"
                )
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
} 