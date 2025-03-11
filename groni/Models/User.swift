import Foundation

struct User: Identifiable, Codable {
    let id: String                     // Firebase Auth UID
    var firstName: String              // User's first name
    var lastName: String               // User's last name
    var username: String               // Display name
    var email: String                  // User's email
    var profileImage: URL?             // Profile photo link
    var followers: [String]            // User IDs of followers
    var following: [String]            // User IDs being followed
    var achievements: [String]         // Earned achievements
    var memberOf: [String]             // Clubs joined
    var stats: UserStats               // Aggregated statistics
    var createdAt: Date                // Account creation date
    var preferences: UserPreferences   // App settings
    var country: String                // User's country
    var dateOfBirth: Date?             // User's date of birth
}

struct UserStats: Codable {
    var totalNegronis: Int
    var averageRating: Double
    var totalPlaces: Int
}

struct UserPreferences: Codable {
    var notifications: Bool
    var privateProfile: Bool
} 