import SwiftUI

struct GroupCard: View {
    let name: String
    let members: Int
    let newPosts: Int
    let color: Color
    var onTapped: () -> Void = {}
    
    var body: some View {
        Button(action: {
            onTapped()
        }) {
            VStack(alignment: .leading, spacing: 8) {
                // Group icon
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color)
                        .frame(height: 60)
                    
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                
                // Group name
                Text(name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                // Member count
                Text("\(members) members")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // New posts badge
                if newPosts > 0 {
                    HStack {
                        Text("\(newPosts) new")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.orange)
                            )
                        
                        Spacer()
                    }
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            )
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack {
        HStack {
            GroupCard(
                name: "Negroni Night",
                members: 8,
                newPosts: 3,
                color: .orange.opacity(0.8)
            )
            
            GroupCard(
                name: "Cocktail Club",
                members: 12,
                newPosts: 5,
                color: .blue.opacity(0.7)
            )
        }
        .padding()
        
        HStack {
            GroupCard(
                name: "NYC",
                members: 42,
                newPosts: 0,
                color: .red.opacity(0.7)
            )
            
            GroupCard(
                name: "London",
                members: 36,
                newPosts: 4,
                color: .purple.opacity(0.7)
            )
        }
        .padding()
    }
    .background(Color.gray.opacity(0.1))
} 