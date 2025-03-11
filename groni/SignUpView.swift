import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentStep = 1
    @StateObject private var authService = AuthService.shared
    
    // User data
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var username = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var country = ""
    @State private var dateOfBirth = Date()
    @State private var isOver18 = false
    
    // Error handling
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            // Progress indicator
            HStack(spacing: 4) {
                ForEach(1...4, id: \.self) { step in
                    Circle()
                        .fill(step <= currentStep ? Color.hex("#E65A2F") : Color.gray.opacity(0.3))
                        .frame(width: 10, height: 10)
                }
                
                Spacer()
                
                // Step counter
                Text("Step \(currentStep) of 4")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Current step view
            Group {
                switch currentStep {
                case 1:
                    EmailPasswordView(
                        email: $email,
                        password: $password,
                        confirmPassword: $confirmPassword,
                        onNext: { currentStep = 2 }
                    )
                case 2:
                    UsernameCountryView(
                        username: $username,
                        firstName: $firstName,
                        lastName: $lastName,
                        country: $country,
                        onNext: { currentStep = 3 },
                        onBack: { currentStep = 1 }
                    )
                case 3:
                    DateOfBirthView(
                        dateOfBirth: $dateOfBirth,
                        onNext: { currentStep = 4 },
                        onBack: { currentStep = 2 }
                    )
                case 4:
                    TermsAndConfirmationView(
                        isOver18: $isOver18,
                        isLoading: $isLoading,
                        onComplete: { completeSignUp() },
                        onBack: { currentStep = 3 }
                    )
                default:
                    Text("Invalid step")
                }
            }
            
            Spacer()
        }
        .navigationTitle("Create Account")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    if currentStep > 1 {
                        currentStep -= 1
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
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
    
    private func completeSignUp() {
        // Ensure username starts with @
        if !username.hasPrefix("@") {
            username = "@\(username)"
        }
        
        isLoading = true
        Task {
            do {
                let user = try await authService.signUp(
                    email: email,
                    password: password,
                    username: username,
                    firstName: firstName,
                    lastName: lastName,
                    country: country,
                    dateOfBirth: dateOfBirth
                )
                
                // Successfully created and saved user
                DispatchQueue.main.async {
                    isLoading = false
                    print("Successfully created user: \(user.username)")
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

// MARK: - Step 1: Email and Password
struct EmailPasswordView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    var onNext: () -> Void
    
    @State private var passwordsMatch = true
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Create your account")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
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
                
                SecureField("Create a password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Confirm Password field
            VStack(alignment: .leading, spacing: 8) {
                Text("Confirm Password")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                SecureField("Confirm your password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                if !passwordsMatch {
                    Text("Passwords do not match")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal)
            
            // Next button
            Button(action: {
                if password == confirmPassword {
                    passwordsMatch = true
                    onNext()
                } else {
                    passwordsMatch = false
                }
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.hex("#E65A2F"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            Spacer()
        }
    }
}

// MARK: - Step 2: Username and Country
struct UsernameCountryView: View {
    @Binding var username: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var country: String
    var onNext: () -> Void
    var onBack: () -> Void
    
    // Sample list of countries
    let countries = ["United States", "United Kingdom", "Canada", "Australia", "Germany", "France", "Japan", "Brazil", "India", "Other"]
    @State private var showingCountryPicker = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Tell us about yourself")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // First Name field
            VStack(alignment: .leading, spacing: 8) {
                Text("First Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("Enter your first name", text: $firstName)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Last Name field
            VStack(alignment: .leading, spacing: 8) {
                Text("Last Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("Enter your last name", text: $lastName)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Username field
            VStack(alignment: .leading, spacing: 8) {
                Text("Username")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("@")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    
                    TextField("Choose a username", text: $username)
                        .autocapitalization(.none)
                }
                .padding(.vertical)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Country selector
            VStack(alignment: .leading, spacing: 8) {
                Text("Country")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    showingCountryPicker = true
                }) {
                    HStack {
                        Text(country.isEmpty ? "Select your country" : country)
                            .foregroundColor(country.isEmpty ? .gray.opacity(0.8) : .black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .sheet(isPresented: $showingCountryPicker) {
                    CountryPickerView(selectedCountry: $country, countries: countries)
                }
            }
            .padding(.horizontal)
            
            // Next button
            Button(action: {
                onNext()
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.hex("#E65A2F"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            .disabled(username.isEmpty || country.isEmpty || firstName.isEmpty || lastName.isEmpty)
            .opacity((username.isEmpty || country.isEmpty || firstName.isEmpty || lastName.isEmpty) ? 0.6 : 1)
            
            Spacer()
        }
    }
}

// Country picker view
struct CountryPickerView: View {
    @Binding var selectedCountry: String
    let countries: [String]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    Button(action: {
                        selectedCountry = country
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text(country)
                            
                            Spacer()
                            
                            if selectedCountry == country {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.hex("#E65A2F"))
                            }
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
            .navigationTitle("Select Country")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Step 3: Date of Birth
struct DateOfBirthView: View {
    @Binding var dateOfBirth: Date
    var onNext: () -> Void
    var onBack: () -> Void
    
    // Calculate the date for 18 years ago
    private var maxDate: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("When were you born?")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Date of Birth")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                DatePicker(
                    "Select your date of birth",
                    selection: $dateOfBirth,
                    in: ...maxDate,
                    displayedComponents: .date
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Text("You must be at least 18 years old to use this app.")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Next button
            Button(action: {
                onNext()
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.hex("#E65A2F"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            Spacer()
        }
    }
}

// MARK: - Step 4: Terms and Confirmation
struct TermsAndConfirmationView: View {
    @Binding var isOver18: Bool
    @Binding var isLoading: Bool
    var onComplete: () -> Void
    var onBack: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Almost done!")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Please review and agree to our terms")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    // Age confirmation
                    Toggle(isOn: $isOver18) {
                        Text("I confirm that I am at least 18 years old")
                            .font(.subheadline)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    // Terms of service
                    HStack(alignment: .top) {
                        Image(systemName: "doc.text")
                            .foregroundColor(Color.hex("#E65A2F"))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Terms of Service")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            Text("By creating an account, you agree to our Terms of Service and Privacy Policy.")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Data usage
                    HStack(alignment: .top) {
                        Image(systemName: "shield")
                            .foregroundColor(Color.hex("#E65A2F"))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Data Usage")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            Text("We collect and use your data as described in our Privacy Policy to provide and improve our services.")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
            // Create Account button
            Button(action: {
                onComplete()
            }) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Create Account")
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
            .disabled(!isOver18 || isLoading)
            .opacity((!isOver18 || isLoading) ? 0.6 : 1)
            
            Spacer()
        }
    }
}

// Custom checkbox toggle style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? Color.hex("#E65A2F") : .gray)
                .font(.system(size: 20, weight: .semibold))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
} 