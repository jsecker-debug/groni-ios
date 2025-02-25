//
//  ProfileView.swift
//  groni
//

import SwiftUI

struct ProfileView: View {
    // Profile data (placeholder values)
    let name = "Joshua Secker"
    let username = "@joshuasecker"
    let followers = 120
    let following = 84
    let groniRank = "#1232"
    let drunkCount = 47
    let toDrinkCount = 23
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile header
                VStack(spacing: 8) {
                    // Name
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        
                    
                    // Profile image
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                    
                    // Username and join date
                    VStack(spacing: 4) {
                        Text(username)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("groni fiend since 2014")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Follower stats
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(followers)")
                                .font(.callout)
                                .fontWeight(.bold)
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        VStack {
                            Text("\(following)")
                                .font(.callout)
                                .fontWeight(.bold)
                            Text("Following")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        VStack {
                            Text(groniRank)
                                .font(.callout)
                                .fontWeight(.bold)
                            Text("Groni Rank")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 5)
                    
                    // Profile buttons
                    HStack(spacing: 12) {
                        Button(action: {
                            // Edit profile action (placeholder)
                        }) {
                            Text("Edit Profile")
                                .font(.callout)
                                .foregroundStyle(.orange)
                                .fontWeight(.medium)
                                .fontDesign(.rounded)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Button(action: {
                            // Share profile action (placeholder)
                        }) {
                            Text("Share Profile")
                                .font(.callout)
                                .foregroundStyle(.orange)
                                .fontWeight(.medium)
                                .fontDesign(.rounded)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                }
                .padding(.top, 12)
                
                // Divider
                Divider()
                    .padding(.top, 2)
                
                // Drink stats section
                VStack(spacing: 12) {
                    // Drunk row
                    HStack {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                            Text("Drunk")
                                .font(.callout)
                        }
                        Spacer()
                        Text("\(drunkCount)")
                            .font(.callout)
                            .fontWeight(.medium)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Divider()
                        .padding(.horizontal, -4)
                    
                    // To Drink row
                    HStack {
                        HStack(spacing: 8) {
                            Image(systemName: "bookmark.fill")
                                .foregroundStyle(.orange)
                            Text("To Drink")
                                .font(.callout)
                        }
                        Spacer()
                        Text("\(toDrinkCount)")
                            .font(.callout)
                            .fontWeight(.medium)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 4)
                .padding(.top, 4)
                
                // Recent Activity Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recent Activity")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // First post card
                    PostCardView()
                        .padding(.top, 4)
                    
                    // Second post card - with different variables
                    VStack {
                        Divider()
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("You")
                                    .font(.body) 
                                    .fontWeight(.bold) +
                                Text(" tried Negroni Sbagliato")
                                    .font(.body)
                                    .fontWeight(.bold)
                                
                                Text("Florence, Italy")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            
                            Text("9.1")
                                .foregroundColor(.green)
                                .font(.title)
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Image(systemName: "text.bubble")
                            Image(systemName: "square.and.arrow.up")
                            
                            Spacer()
                            
                            Text("12 likes")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                    }
                    
                    // Third post card - with different variables
                    VStack {
                        Divider()
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("You")
                                    .font(.body) 
                                    .fontWeight(.bold) +
                                Text(" bookmarked White Negroni")
                                    .font(.body)
                                    .fontWeight(.bold)
                                
                                Text("New York, USA")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.orange)
                                .font(.title)
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "heart")
                            Image(systemName: "text.bubble")
                            Image(systemName: "square.and.arrow.up")
                            
                            Spacer()
                            
                            Text("5 likes")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
