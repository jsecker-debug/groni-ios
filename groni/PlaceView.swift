import SwiftUI
import MapKit

struct PlaceView: View {
    // Sample data using Dante NYC (previously used in the app)
    var placeName: String
    let category: String = "Cocktail Bar • Italian • Date Night • Aperitivo • Historic"
    let priceRange: String = "$$$"
    let cuisine: String = "Italian, Cocktails"
    let location: String = "New York, USA"
    let avgScore: Double = 9.2
    let friendScore: Double = 8.9
    let friendsWantToTry: Int = 5
    let coordinate = CLLocationCoordinate2D(latitude: 40.7295, longitude: -74.0027) // NYC coordinates
    
    // Adding missing variables
    let description: String = "Dante is an award-winning cocktail bar in Greenwich Village, known for its world-class Negronis and Italian aperitivo culture. The historic establishment has been a neighborhood fixture since 1915 and was named World's Best Bar in 2019."
    let address: String = "79-81 MacDougal St, New York, NY 10012"
    let hours: String = "Mon-Sun: 10:00 AM - 2:00 AM"
    let phone: String = "+1 (212) 982-5275"
    let website: String = "www.dante-nyc.com"
    
    @Environment(\.presentationMode) var presentationMode
    @State private var mapRegion: MKCoordinateRegion
    @State private var selectedTime: String? = nil
    @State private var showingFullMap = false
    @State private var selectedTab = 0
    
    // Sample reservation times
    let availableTimes = ["5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
    let tabs = ["About", "Reservations"]
    
    init(placeName: String = "Dante NYC") {
        self.placeName = placeName
        // Initialize the map region with the place's coordinates
        _mapRegion = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7295, longitude: -74.0027),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Map at the top instead of image
                ZStack(alignment: .topLeading) {
                    // Map view
                    Map(coordinateRegion: $mapRegion, annotationItems: [MapAnnotation(coordinate: coordinate)]) { annotation in
                        MapMarker(coordinate: annotation.coordinate, tint: .orange)
                    }
                    .frame(height: 250)
                    .disabled(!showingFullMap)
                    
                    // Back button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Circle().fill(Color.black.opacity(0.5)))
                            .padding(16)
                    }
                    
                    // Expand map button
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                showingFullMap.toggle()
                            }) {
                                Image(systemName: showingFullMap ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Circle().fill(Color.black.opacity(0.6)))
                                    .padding(16)
                            }
                        }
                    }
                    .frame(height: 250)
                }
                
                // Place info
                VStack(alignment: .leading, spacing: 16) {
                    // Name and rating
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(placeName)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        // Rating badge
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                            
                            Text(String(format: "%.1f", avgScore))
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(ratingColor(avgScore))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    // Add and Save buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            // Add action
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.orange)
                                Text("Add")
                                    .foregroundColor(.orange)
                                    .fontWeight(.medium)
                            }
                        }
                        
                        Button(action: {
                            // Save action
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "bookmark.fill")
                                    .foregroundColor(.orange)
                                Text("Save")
                                    .foregroundColor(.orange)
                                    .fontWeight(.medium)
                            }
                        }
                        
                        Spacer()
                        
                        Text(address)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                    
                    // Category and price
                    HStack {
                        Text(category)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(priceRange)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    
                    // Tab headers
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
                    .padding(.top, 16)
                    
                    // Tab content
                    if selectedTab == 0 {
                        // About tab content
                        aboutTabContent
                    } else {
                        // Reservations tab content
                        reservationsTabContent
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .toolbar(.hidden)
    }
    
    // About tab content
    private var aboutTabContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Rating cards section
            VStack(spacing: 16) {
                Text("Ratings")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
                
                HStack(spacing: 16) {
                    // Average score card
                    VStack(spacing: 4) {
                        Text("Average")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(String(format: "%.1f", avgScore))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(ratingColor(avgScore))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    )
                    
                    // Friends score card
                    VStack(spacing: 4) {
                        Text("Friends")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(String(format: "%.1f", friendScore))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(ratingColor(friendScore))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    )
                    
                    // Friends want to try card
                    VStack(spacing: 4) {
                        Text("Want to Try")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("\(friendsWantToTry)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                    )
                }
            }
            .padding(.horizontal, 16)
            
            // Photos carousel
            VStack(alignment: .leading, spacing: 12) {
                Text("Photos")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        // Photo cards - using different gradient colors as placeholders
                        ForEach(0..<5, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(photoGradient(for: index))
                                .frame(width: 150, height: 150)
                                .overlay(
                                    Image(systemName: "wineglass.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white.opacity(0.8))
                                )
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            
            // Description
            VStack(alignment: .leading, spacing: 8) {
                Text("About")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
            }
            .padding(.horizontal, 16)
            
            // Info section
            VStack(alignment: .leading, spacing: 12) {
                Text("Information")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                // Hours
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "clock.fill")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Hours")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        Text(hours)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Phone
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "phone.fill")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Phone")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        Text(phone)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Website
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "globe")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Website")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        Text(website)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
    }
    
    // Reservations tab content
    private var reservationsTabContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Reservation header
            VStack(alignment: .leading, spacing: 8) {
                Text("Make a Reservation")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                
                Text("Select a time to reserve a table at \(placeName)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            
            // Date picker
            VStack(alignment: .leading, spacing: 8) {
                Text("Date")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                // Date picker placeholder (would be replaced with actual date picker)
                HStack {
                    Text("Today, \(formattedDate())")
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "calendar")
                        .foregroundColor(.orange)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                )
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            // Party size
            VStack(alignment: .leading, spacing: 8) {
                Text("Party Size")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                // Party size selector placeholder
                HStack {
                    Text("2 People")
                        .font(.body)
                    
                    Spacer()
                    
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.orange)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                )
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
            // Available times
            VStack(alignment: .leading, spacing: 8) {
                Text("Available Times")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.top, 8)
                
                // Time slots
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(availableTimes, id: \.self) { time in
                            Button(action: {
                                selectedTime = time
                            }) {
                                Text(time)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(selectedTime == time ? Color.orange : Color.gray.opacity(0.1))
                                    )
                                    .foregroundColor(selectedTime == time ? .white : .primary)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            .padding(.horizontal, 0)
            
            // Reserve button
            if selectedTime != nil {
                Button(action: {
                    // Reserve action
                }) {
                    Text("Reserve for \(selectedTime ?? "")")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.orange)
                        )
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            
            // Restaurant policies
            VStack(alignment: .leading, spacing: 8) {
                Text("Restaurant Policies")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 24)
                
                VStack(alignment: .leading, spacing: 12) {
                    policyRow(icon: "clock.fill", title: "Reservation Hold", description: "Tables will be held for 15 minutes after reservation time")
                    
                    policyRow(icon: "creditcard.fill", title: "Cancellation Policy", description: "Cancel up to 2 hours before your reservation without charge")
                    
                    policyRow(icon: "person.fill", title: "Dress Code", description: "Smart casual attire is recommended")
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
    }
    
    // Helper function for policy rows
    private func policyRow(icon: String, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.orange)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    
    // Helper function to format today's date
    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
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
    
    // Helper function to generate different gradients for photo cards
    private func photoGradient(for index: Int) -> LinearGradient {
        let gradients: [LinearGradient] = [
            LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.7), Color.orange.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.7), Color.orange.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.teal.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing),
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.7), Color.yellow.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        ]
        
        return gradients[index % gradients.count]
    }
}

// Helper struct for map annotation
struct MapAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    PlaceView()
} 