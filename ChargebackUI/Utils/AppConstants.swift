//
//  AppConstants.swift
//  ChargebackUI
//
//  Created by AT DeviOS on 06/11/25.
//

import SwiftUI

struct AppColors {
    static let background = Color(hex: "#F4F5F7")
    static let white = Color.white
    static let black = Color.black
    static let grayText = Color.gray
    static let inactiveGray = Color(hex: "#98A2B3")
    static let textColor = Color(hex: "#212121")
    static let activeBlue = Color(hex: "#002FFF")
    static let divider = Color(hex: "#E3E6EB")
    static let subText = Color(hex: "#636A79")
    static let border = Color(hex: "#D0D5DD")
    static let blueTint = Color(hex: "#002FFF").opacity(0.1)
    static let shadow = Color.black.opacity(0.05)
    static let lightGray = Color(hex: "#F2F4F7")
}

struct AppStrings {
    static let createSubscriptionTitle = "Create Subscription"
    static let save = "Save"
    static let chooseService = "Choose a service"
    static let name = "Name"
    static let amount = "Amount"
    static let category = "Category"
    static let startDate = "Start Date"
    static let frequency = "Frequency"
    static let active = "Active"
    static let defaultAmount = "$0"
    static let welcomeToChargebackUI = "Welcome to ChargebackUI"
    static let done = "Done"
    static let service = "Services"
}
