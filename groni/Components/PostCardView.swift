import SwiftUI

struct PostCardView: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(systemName: "person.fill") // Placeholder for profile picture
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("You")
                        .font(.body) 
                        .fontWeight(.bold) +
                    Text(" ranked Bottarga")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text("London, UK")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Text("8.3")
                    .foregroundColor(.green)
                    .font(.title)
            }
            .padding()
            
            HStack {
                Image(systemName: "heart")
                Image(systemName: "text.bubble")
                Image(systemName: "square.and.arrow.up")
                
                Spacer()
                
                Text("3 likes")
                    .font(.caption)
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}

#Preview {
    PostCardView()
} 