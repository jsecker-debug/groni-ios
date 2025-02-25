//
//  ProfileView.swift
//  groni
//

import SwiftUI

struct ProfileView: View {
    // Profile data (placeholder values)
    let name = "Joshua Secker"
    let followers = 125
    let following = 84
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile header
                VStack(spacing: 10) {
                    // Profile image
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                    
                    // Name
                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Follower stats
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(followers)")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Followers")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack {
                            Text("\(following)")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Following")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 5)
                    
                    // Edit profile button
                    Button(action: {
                        // Edit profile action (placeholder)
                    }) {
                        Text("Edit Profile")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                }
                .padding(.top, 20)
                
                // Divider
                Divider()
                    .padding(.top, 5)
                
                // Placeholder for content
                Text("No posts yet")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, minHeight: 300)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
