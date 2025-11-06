//
//  CreateSubscriptionView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//
import SwiftUI

struct CreateSubscriptionView: View {
    // MARK: - State Properties
    @Environment(\.dismiss) private var dismiss
    @State private var service: SubscriptionService?
    @State private var category: SubscriptionCategory = .subscription
    @State private var startDate: Date = Date()
    @State private var frequency: Frequency = .weekly
    @State private var isActive: Bool = true
    @State private var showServicePicker: Bool = false
    @State private var showFrequencyPicker: Bool = false
    @State private var showCategoryPicker: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        serviceSelectionCard
                        formFieldsPart1
                        formFieldsPart2
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        ZStack {
                            Circle()
                                .stroke(AppColors.border, lineWidth: 1)
                                .fill(AppColors.white)
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "xmark")
                                .foregroundColor(AppColors.black)
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(AppStrings.createSubscriptionTitle)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(AppColors.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppStrings.save) {
                        if service != nil { saveSubscription() }
                    }
                    .disabled(service == nil)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(service == nil ? AppColors.inactiveGray : AppColors.activeBlue)
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showServicePicker) {
            ServicePickerView(selectedService: $service)
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showCategoryPicker) {
            CategoryPickerView(selectedCategory: $category)
                .presentationDetents([.height(325)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showFrequencyPicker) {
            FrequencyPickerView(selectedFrequency: $frequency)
                .presentationDetents([.height(210)])
                .presentationDragIndicator(.visible)

        }
    }
    
    // MARK: - Service Selection Card
    private var serviceSelectionCard: some View {
        Button(action: { showServicePicker = true }) {
            HStack(spacing: 16) {
                ZStack {
                    if let icon = service?.icon {
                        Image(icon)
                            .frame(width: 50, height: 50)
                    } else {
                        Circle()
                            .fill(AppColors.blueTint)
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(AppColors.activeBlue)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(service?.name ?? AppStrings.chooseService)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(service != nil ? AppColors.textColor:AppColors.inactiveGray)
                    
                    Text(service != nil ? "$\(service!.price)" : AppStrings.defaultAmount)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(AppColors.subText)
                }
                
                Spacer()
            }
            .padding(16)
            .background(AppColors.white)
            .cornerRadius(12)
            .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 2)
        }
    }
    
    // MARK: - Form Fields Part 1
    private var formFieldsPart1: some View {
        VStack(spacing: 8) {
            FormRow(
                label: AppStrings.name,
                value: service?.name ?? AppStrings.chooseService,
                imageValue: "",
                placeholder: AppStrings.chooseService,
                isButton: true,
                action: { showServicePicker = true }
            )
            
            Divider().foregroundColor(AppColors.divider)
            
            FormRow(
                label: AppStrings.amount,
                value: service != nil ? "$\(service!.price)" : AppStrings.defaultAmount,
                imageValue: "",
                placeholder: AppStrings.defaultAmount,
                isButton: false
            )
            
            Divider().foregroundColor(AppColors.divider)
            
            FormRow(
                label: AppStrings.category,
                value: category.id,
                imageValue: category.icon,
                placeholder: "",
                isButton: true,
                action: { showCategoryPicker = true }
            )
        }
        .padding(16)
        .background(AppColors.white)
        .cornerRadius(12)
        .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 2)
    }
    
    // MARK: - Form Fields Part 2
    private var formFieldsPart2: some View {
        VStack(spacing: 8) {
            FormDateRow(label: AppStrings.startDate, date: $startDate)
            
            Divider().foregroundColor(AppColors.divider)
            
            FormRow(
                label: AppStrings.frequency,
                value: frequency.rawValue,
                imageValue: "",
                placeholder: "",
                isButton: true,
                action: { showFrequencyPicker = true }
            )
            
            Divider().foregroundColor(AppColors.divider)
            
            FormToggleRow(label: AppStrings.active, isOn: $isActive)
        }
        .padding(16)
        .background(AppColors.white)
        .cornerRadius(12)
        .shadow(color: AppColors.shadow, radius: 8, x: 0, y: 2)
    }
    
    private func saveSubscription() {
        print("Saving subscription...")
        dismiss()
    }
}


// MARK: - Preview
struct CreateSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSubscriptionView()
    }
}
