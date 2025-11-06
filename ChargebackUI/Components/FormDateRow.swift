//
//  FormDateRow.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

struct FormDateRow: View {
    let label: String
    @Binding var date: Date
    @State private var showDatePicker = false

    var body: some View {
        Button {
            showDatePicker = true
        } label: {
            HStack {
                Text(label)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack {
                    Text(formattedDate)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(AppColors.black)
                }
                .padding(.horizontal,16)
                .padding(.vertical, 12)
                .background(AppColors.lightGray)
                .cornerRadius(10)
            }
            .padding(.vertical, 12)
        }
        .sheet(isPresented: $showDatePicker) {
            DatePickerView(
                selectedDate: $date,
                isPresented: $showDatePicker
            )
            .presentationDetents([.height(300)])
            .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Custom date formatter
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" // 👉 e.g. Apr 12, 2021
        return formatter.string(from: date)
    }
}



