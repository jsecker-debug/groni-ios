import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class AuthService: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    private let db: Firestore
    private let usersCollection: CollectionReference
    private var authStateListener: AuthStateDidChangeListenerHandle?
    
    private init() {
        // Initialize Firestore
        self.db = Firestore.firestore()
        
        // Set up the users collection reference
        self.usersCollection = self.db.collection("users")
        
        // Listen for auth state changes
        self.authStateListener = auth.addStateDidChangeListener { [weak self] _, user in
            if let user = user {
                self?.isAuthenticated = true
                self?.fetchUser(userId: user.uid)
            } else {
                self?.isAuthenticated = false
                self?.currentUser = nil
            }
        }
    }
    
    deinit {
        if let listener = authStateListener {
            auth.removeStateDidChangeListener(listener)
        }
    }
    
    func signUp(email: String, password: String, username: String, country: String, dateOfBirth: Date) async throws -> User {
        // 1. Create Firebase Auth user
        let authResult = try await auth.createUser(withEmail: email, password: password)
        
        // 2. Create User object
        let newUser = User(
            id: authResult.user.uid,
            username: username,
            email: email,
            profileImage: nil,
            followers: [],
            following: [],
            achievements: [],
            memberOf: [],
            stats: UserStats(totalNegronis: 0, averageRating: 0, totalPlaces: 0),
            createdAt: Date(),
            preferences: UserPreferences(notifications: true, privateProfile: false),
            country: country,
            dateOfBirth: dateOfBirth
        )
        
        // 3. Save user to Firestore
        let userData: [String: Any] = [
            "id": newUser.id,
            "username": newUser.username,
            "email": newUser.email,
            "profileImage": newUser.profileImage?.absoluteString as Any,
            "followers": newUser.followers,
            "following": newUser.following,
            "achievements": newUser.achievements,
            "memberOf": newUser.memberOf,
            "stats": [
                "totalNegronis": newUser.stats.totalNegronis,
                "averageRating": newUser.stats.averageRating,
                "totalPlaces": newUser.stats.totalPlaces
            ],
            "createdAt": newUser.createdAt,
            "preferences": [
                "notifications": newUser.preferences.notifications,
                "privateProfile": newUser.preferences.privateProfile
            ],
            "country": newUser.country,
            "dateOfBirth": newUser.dateOfBirth as Any
        ]
        
        try await usersCollection.document(authResult.user.uid).setData(userData)
        
        return newUser
    }
    
    func signIn(email: String, password: String) async throws {
        try await auth.signIn(withEmail: email, password: password)
    }
    
    func signOut() throws {
        try auth.signOut()
    }
    
    private func fetchUser(userId: String) {
        usersCollection.document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(),
                  error == nil else {
                print("Error fetching user: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Convert Firestore data to User object
            let stats = UserStats(
                totalNegronis: data["stats.totalNegronis"] as? Int ?? 0,
                averageRating: data["stats.averageRating"] as? Double ?? 0,
                totalPlaces: data["stats.totalPlaces"] as? Int ?? 0
            )
            
            let preferences = UserPreferences(
                notifications: data["preferences.notifications"] as? Bool ?? true,
                privateProfile: data["preferences.privateProfile"] as? Bool ?? false
            )
            
            self?.currentUser = User(
                id: data["id"] as? String ?? "",
                username: data["username"] as? String ?? "",
                email: data["email"] as? String ?? "",
                profileImage: URL(string: data["profileImage"] as? String ?? ""),
                followers: data["followers"] as? [String] ?? [],
                following: data["following"] as? [String] ?? [],
                achievements: data["achievements"] as? [String] ?? [],
                memberOf: data["memberOf"] as? [String] ?? [],
                stats: stats,
                createdAt: (data["createdAt"] as? Timestamp)?.dateValue() ?? Date(),
                preferences: preferences,
                country: data["country"] as? String ?? "",
                dateOfBirth: (data["dateOfBirth"] as? Timestamp)?.dateValue()
            )
        }
    }
} 