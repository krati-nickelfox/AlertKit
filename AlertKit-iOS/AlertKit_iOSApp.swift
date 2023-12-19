//
//  AlertKit_iOSApp.swift
//  AlertKit-iOS
//
//  Created by Krati Mittal on 14/12/23.
//

import SwiftUI

@main
struct AlertKit_iOSApp: App {
    
    var environment = Environment(descFontSize: 16.0, primaryButtonColor: .yellow, secondaryButtonColor: .colorGray, backgroundColor: .colorBackground, primaryButtonTextColor: .black, secondaryButtonTextColor: .colorTitle, titleColor: .black)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(environment)
        }
    }
}
