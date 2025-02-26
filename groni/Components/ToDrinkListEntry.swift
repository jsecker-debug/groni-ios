import SwiftUI

struct ToDrinkListEntry: View {
    let rank: Int
    let restaurantName: String
    let location: String
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
        ToDrinkListEntry(
            rank: 1,
            restaurantName: "Dante NYC",
            location: "New York, USA",
            imageName: "fork.knife.circle.fill"
        )
        
        ToDrinkListEntry(
            rank: 2,
            restaurantName: "Bar Termini",
            location: "London, UK",
            imageName: "fork.knife.circle.fill"
        )
    }
    .background(Color.gray.opacity(0.1))
} 