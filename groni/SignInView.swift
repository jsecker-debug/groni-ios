import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSignUp = false
    @StateObject private var authService = AuthService.shared
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 24) {
            // Logo or app name
            Text("groni")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.hex("#E65A2F"))
                .padding(.top, 60)
                .padding(.bottom, 40)
            
            // Email field
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Password field
            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                SecureField("Enter your password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Sign in button
            Button(action: {
                signIn()
            }) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Sign In")
                        .font(.headline)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.hex("#E65A2F"))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 16)
            .disabled(isLoading)
            
            // Or divider
            HStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                
                Text("OR")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
            // Social sign in buttons
            VStack(spacing: 16) {
                // Google sign in
                Button(action: {
                    // Google sign in action (to be implemented)
                }) {
                    HStack {
                        Image(systemName: "g.circle.fill")
                            .font(.title3)
                        
                        Text("Sign in with Google")
                            .font(.headline)
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                // Apple sign in
                Button(action: {
                    // Apple sign in action (to be implemented)
                }) {
                    HStack {
                        Image(systemName: "apple.logo")
                            .font(.title3)
                        
                        Text("Sign in with Apple")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            // Sign up link
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
                    .font(.subheadline)
                    .foregroundColor(Color.hex("#E65A2F"))
                    .underline()
            }
            .padding(.top, 24)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.hex("#E65A2F"))
                }
            }
        }
        .alert("Error", isPresented: $showingError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(errorMessage)
        }
    }
    
    private func signIn() {
        isLoading = true
        Task {
            do {
                try await authService.signIn(email: email, password: password)
                // Navigate to main view after successful sign in
                DispatchQueue.main.async {
                    isLoading = false
                    // Navigation will be handled by the app's root view based on authService.isAuthenticated
                }
            } catch {
                DispatchQueue.main.async {
                    isLoading = false
                    errorMessage = error.localizedDescription
                    showingError = true
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        SignInView()
    }
} 