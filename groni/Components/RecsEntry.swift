import SwiftUI

struct RecsEntry: View {
    let rank: Int
    let restaurantName: String
    let location: String
    let score: String
    let imageName: String
    var onTapped: () -> Void = {}
    
    var body: some View {
        Button(action: {
            onTapped()
        }) {
            HStack(spacing: 12) {
                // Rank number
                Text("\(rank).")
                    .font(.body)
                    .fontWeight(.medium)
                    .frame(width: 30, alignment: .leading)
                    .foregroundColor(.primary)
                
                // Restaurant image
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                
                // Restaurant info
                VStack(alignment: .leading, spacing: 2) {
                    Text(restaurantName)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(location)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Avg Score label
                Text("Avg Score")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing, 4)
                
                // Score
                Text(score)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                // Arrow
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .padding(.leading, 4)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack {
        RecsEntry(
            rank: 1,
            restaurantName: "Dante NYC",
            location: "New York, USA",
            score: "9.2",
            imageName: "fork.knife.circle.fill"
        )
        
        RecsEntry(
            rank: 2,
            restaurantName: "Bar Termini",
            location: "London, UK",
            score: "8.7",
            imageName: "fork.knife.circle.fill"
        )
    }
    .background(Color.gray.opacity(0.1))
} 