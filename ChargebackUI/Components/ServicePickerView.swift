//
//  ServicePickerView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Service Picker View
struct ServicePickerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedService: SubscriptionService?
    @State private var searchText: String = ""
    
    private let services = [
        SubscriptionService(name: "Netflix", price: 15.0, icon: "Netflix"),
        SubscriptionService(name: "Hulu", price: 12.99, icon: "Hulu"),
        SubscriptionService(name: "Spotify", price: 9.99, icon: "Spotify"),
        SubscriptionService(name: "PlayStation+", price: 14.99, icon: "PlayStation"),
        SubscriptionService(name: "Paramount+", price: 9.99, icon: "Paramount"),
        SubscriptionService(name: "YouTube Music", price: 10.99, icon: "YouTube_Music")
    ]
    
    // Filtered list (case-insensitive)
    private var filteredServices: [SubscriptionService] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return services
        } else {
            return services.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
                        .font(.system(size: 17))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColors.border, lineWidth: 2)
                )
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                // MARK: Services List
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(filteredServices, id: \.id) { service in
                            Button(action: {
                                selectedService = service
                            }) {
                                HStack(spacing: 16) {
                                    Image(service.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(6)
                                    
                                    Text(service.name)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    if selectedService?.name == service.name {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundColor(AppColors.activeBlue)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .frame(minHeight: 60)
                            }
                            .buttonStyle(.plain)
                            
                            if service.id != filteredServices.last?.id {
                                Divider()
                                    .padding(.leading, 20)
                            }
                        }
                        
                        if filteredServices.isEmpty {
                            Text("No services found")
                                .foregroundColor(.gray)
                                .padding(.top, 24)
                        }
                    }
                    .animation(.easeInOut, value: filteredServices)
                }
                .padding(.top, 16)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(AppStrings.service)
                        .font(.system(size: 18, weight: .medium))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppStrings.done) {
                        dismiss()
                    }
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppColors.activeBlue)
                }
            }
        }
    }
}
