//
//  FeedView.swift
//  groni
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Feed header
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Your Feed")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            // Filter action
                        }) {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(.title3)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal, 3)
                    
                    Text("Latest negroni experiences from your network")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                
                // Feed posts
                FeedPost(
                    username: "joshuasecker",
                    placeName: "Dante NYC",
                    location: "New York, USA",
                    rating: 9.2,
                    likes: 87,
                    comments: 14,
                    date: "Just now"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "emilywilson",
                    placeName: "Bar Termini",
                    location: "London, UK",
                    rating: 8.9,
                    likes: 64,
                    comments: 8,
                    date: "15 minutes ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "michaelchen",
                    placeName: "Caffe Rivoire",
                    location: "Florence, Italy",
                    rating: 9.4,
                    likes: 112,
                    comments: 23,
                    date: "1 hour ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "sophiagarcia",
                    placeName: "Bar Basso",
                    location: "Milan, Italy",
                    rating: 8.5,
                    likes: 42,
                    comments: 7,
                    date: "2 hours ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "davidsmith",
                    placeName: "Clover Club",
                    location: "Brooklyn, USA",
                    rating: 8.7,
                    likes: 56,
                    comments: 11,
                    date: "3 hours ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "oliviabrown",
                    placeName: "Polpo",
                    location: "London, UK",
                    rating: 7.8,
                    likes: 31,
                    comments: 5,
                    date: "5 hours ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "noahjohnson",
                    placeName: "Cafe Trussardi",
                    location: "Milan, Italy",
                    rating: 9.1,
                    likes: 78,
                    comments: 16,
                    date: "Yesterday"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "emmadavis",
                    placeName: "The Connaught Bar",
                    location: "London, UK",
                    rating: 9.3,
                    likes: 94,
                    comments: 19,
                    date: "Yesterday"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "liamwilson",
                    placeName: "Amor y Amargo",
                    location: "New York, USA",
                    rating: 8.2,
                    likes: 47,
                    comments: 9,
                    date: "2 days ago"
                )
                .padding(.bottom, 16)
                
                FeedPost(
                    username: "avamartinez",
                    placeName: "Caffe Giacosa",
                    location: "Florence, Italy",
                    rating: 8.8,
                    likes: 63,
                    comments: 12,
                    date: "3 days ago"
                )
            }
            .padding(.horizontal)
            .padding(.bottom, 80) // Extra padding at bottom for tab bar
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
