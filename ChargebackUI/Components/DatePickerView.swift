//
//  DatePickerView.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
                // Wheel Picker
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .accentColor(AppColors.activeBlue)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                
                Spacer()
            }
            .background(AppColors.white)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Start Date")
                        .font(.system(size: 17, weight: .semibold))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppStrings.save) {
                        isPresented = false
                    }
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(AppColors.activeBlue)
                }
            }
        }
    }
}
