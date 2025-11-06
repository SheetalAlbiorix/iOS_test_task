//
//  FormDateRow.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

// MARK: - Form Date Row Component
//struct FormDateRow: View {
//    let label: String
//    @Binding var date: Date
//    
//    var body: some View {
//        HStack {
//            Text(label)
//                .font(.system(size: 15, weight: .regular))
//                .foregroundColor(Color.gray)
//            
//            Spacer()
//            
//            DatePicker("", selection: $date, displayedComponents: .date)
//                .labelsHidden()
//                .accentColor(AppColors.activeBlue)
//        }
//        .padding(.vertical, 12)
//    }
//}

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
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(date, style: .date)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(AppColors.black)
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
}


