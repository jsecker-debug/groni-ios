import SwiftUI

struct CustomNavBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            // Home button
            Button(action: {
                selectedTab = 0
            }) {
                VStack(spacing: 2) {
                    Image(systemName: "house.fill")
                        .font(.title3)
                        .foregroundColor(selectedTab == 0 ? .orange : .black)
                    
                    Text("Feed")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 0 ? .orange : .black.opacity(0.7))
                }
            }
            
            Spacer()
            
            // Lists button
            Button(action: {
                selectedTab = 1
            }) {
                VStack(spacing: 2) {
                    Image(systemName: "list.bullet")
                        .font(.title3)
                        .foregroundColor(selectedTab == 1 ? .orange : .black)
                    
                    Text("Lists")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 1 ? .orange : .black.opacity(0.7))
                }
            }
            
            Spacer()
            
            // Add button (center, orange)
            Button(action: {
                selectedTab = 2
            }) {
                VStack(spacing: 2) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.90, green: 0.35, blue: 0.18))
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Text("Add")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 2 ? .orange : .black.opacity(0.7))
                }
            }
            
            Spacer()
            
            // Stats button
            Button(action: {
                selectedTab = 3
            }) {
                VStack(spacing: 2) {
                    Image(systemName: "chart.pie")
                        .font(.title3)
                        .foregroundColor(selectedTab == 3 ? .orange : .black)
                    
                    Text("Stats")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 3 ? .orange : .black.opacity(0.7))
                }
            }
            
            Spacer()
            
            // Profile button
            Button(action: {
                selectedTab = 4
            }) {
                VStack(spacing: 2) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title3)
                        .foregroundColor(selectedTab == 4 ? .orange : .black)
                    
                    Text("Profile")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 4 ? .orange : .black.opacity(0.7))
                }
            }
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.bottom, 2)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(
            Divider().opacity(0.3), alignment: .top
        )
    }
}

#Preview {
    CustomNavBar(selectedTab: .constant(0))
} 