import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // Center groni text
                Text("groni")
                    .font(.custom("AkayaKanadaka-Regular", size: 28))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Notifications button positioned on the right
                HStack {
                    Spacer()
                    Button(action: {
                        // Notification action
                    }) {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.horizontal)
            .padding(.top, 4)
            .padding(.bottom, 12)
            
            Divider()
        }
        .background(Color.white)
    }
}

#Preview {
    HeaderView()
} 
