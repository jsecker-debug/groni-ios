import SwiftUI

struct ListEntry: View {
    let rank: Int
    let restaurantName: String
    let location: String
    let score: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 12) {
            // Rank number
            Text("\(rank).")
                .font(.body)
                .fontWeight(.medium)
                .frame(width: 30, alignment: .leading)
            
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
                
                Text(location)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Score
            Text(score)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            // Arrow
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .padding(.leading, 4)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
}

#Preview {
    VStack {
        ListEntry(
            rank: 1,
            restaurantName: "Dante NYC",
            location: "New York, USA",
            score: "9.2",
            imageName: "fork.knife.circle.fill"
        )
        
        ListEntry(
            rank: 2,
            restaurantName: "Bar Termini",
            location: "London, UK",
            score: "8.7",
            imageName: "fork.knife.circle.fill"
        )
    }
    .background(Color.gray.opacity(0.1))
} 