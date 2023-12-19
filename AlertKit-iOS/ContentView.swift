//
//  ContentView.swift
//  AlertKit-iOS
//
//  Created by Krati Mittal on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var alertWithTwoButtons = false
    @State var alertWithOneButton = false
    @State var alertWithAnotherTitle = false
    @State var alertWithAnotherMessage = false
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                Button("Alert with 2 buttons"){
                    alertWithTwoButtons.toggle()
                }
                Button("Alert with 1 button") {
                    alertWithOneButton.toggle()
                }.padding(.top, 10)
                Button("Alert with different Title") {
                    alertWithAnotherTitle.toggle()
                }.padding(.top, 10)
                Button("Alert with different Message") {
                    alertWithAnotherMessage.toggle()
                }.padding(.top, 10)
            }
            
            if alertWithTwoButtons{
                CustomAlertView(image: "notification-image",secondaryButtonTitle: "Not now", primaryButtonTitle: "Update", secondaryButtonAction: { alertWithTwoButtons.toggle() }
             )
             }
            
            if alertWithOneButton{
                CustomAlertView(primaryButtonTitle: "Cancel", primaryButtonAction: { alertWithOneButton.toggle() }
                )
            }
            if alertWithAnotherTitle{
                CustomAlertView(title: "New Alert",secondaryButtonTitle: "Not now", primaryButtonTitle: "Update", secondaryButtonAction: { alertWithAnotherTitle.toggle() }
                )
            }
            if alertWithAnotherMessage{
                CustomAlertView(message: "New Alert is here, you want to proceed with this.",secondaryButtonTitle: "Not now", primaryButtonTitle: "Update", secondaryButtonAction: { alertWithAnotherMessage.toggle() }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
