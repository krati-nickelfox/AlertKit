//
//  AlertKit_iOSApp.swift
//  AlertKit-iOS
//
//  Created by Krati Mittal on 14/12/23.
//

import SwiftUI

@main
struct AlertKit_iOSApp: App {
    
    var environment = Environment(
        descriptionFontSize: 16.0,
        primaryButtonColor: .yellow,
        secondaryButtonColor: .colorGray,
        backgroundColor: .colorBackground,
        primaryButtonTextColor: .black,
        secondaryButtonTextColor: .colorTitle,
        titleColor: .colorTitle,
        descriptionColor:.colorLightGray,
        primaryButtonTextSize:16.0,
        secondaryButtonTextSize: 16.0,
        titleFontSize: 16.0,
        titleFont: "Roboto-Medium",
        descriptionFont: "Roboto-Medium",
        buttonTextFont: "Roboto-Regular"
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(environment)
        }
    }
}
