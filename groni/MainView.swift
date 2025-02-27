import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderView()
            
            // Content area
            ZStack(alignment: .bottom) {
                // Tab content
                ZStack {
                    FeedView()
                        .opacity(selectedTab == 0 ? 1 : 0)
                    
                    ListsView()
                        .opacity(selectedTab == 1 ? 1 : 0)
                    
                    AddView()
                        .opacity(selectedTab == 2 ? 1 : 0)
                    
                    StatsView()
                        .opacity(selectedTab == 3 ? 1 : 0)
                    
                    ProfileView()
                        .opacity(selectedTab == 4 ? 1 : 0)
                }
                .padding(.bottom, 30) // Reduced padding to bring content closer to navbar
                
                // Custom navbar from Components directory
                CustomNavBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.keyboard) // Ensures keyboard appears as top layer
        }
    }
}

#Preview {
    MainView()
} 