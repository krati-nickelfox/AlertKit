//
//  CustomAlertView.swift
//  AlertKit-iOS
//
//  Created by Nickelfox on 15/12/23.
//

import SwiftUI

class Environment: ObservableObject {
    @Published var descriptionFontSize: CGFloat = 16.0
    @Published var titleFontSize: CGFloat = 16.0
    @Published var primaryButtonColor: Color = .colorBlue
    @Published var secondaryButtonColor: Color = .colorGray
    @Published var backgroundColor: Color = .colorBackground
    @Published var primaryButtonTextColor: Color = .white
    @Published var secondaryButtonTextColor: Color = .colorTitle
    @Published var titleColor: Color = .colorTitle
    @Published var descriptionColor: Color = .colorTitle
    
    init(descriptionFontSize: CGFloat, primaryButtonColor: Color, secondaryButtonColor: Color, backgroundColor: Color, primaryButtonTextColor: Color, secondaryButtonTextColor: Color, titleColor: Color) {
        self.descriptionFontSize = descriptionFontSize
        self.titleFontSize = titleFontSize
        self.primaryButtonColor = primaryButtonColor
        self.secondaryButtonColor = secondaryButtonColor
        self.backgroundColor = backgroundColor
        self.primaryButtonTextColor = primaryButtonTextColor
        self.secondaryButtonTextColor = secondaryButtonTextColor
        self.titleColor = titleColor
    }
}


struct CustomAlertView: View {
    @EnvironmentObject var environment: Environment
    
    var title: String? = nil
    var message: String = "A new software version is available for dowmload"
    var image: String? = nil
    var secondaryButtonTitle: String? = nil
    var primaryButtonTitle: String = "Cancel"
    var secondaryButtonAction: () -> () = {}
    var primaryButtonAction: () -> () = {}
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            VStack{
                if(image != nil){
                    CustomImageView(image: image!)
                }
                
                if(title != nil){
                    TitleTextView(title: title!, titleColor: environment.titleColor, textSize: environment.titleFontSize)
                }
                
                DescriptionTextView(message: message, messageColor: .colorLightGray, textSize: environment.descriptionFontSize)
                
                HStack{
                    if(secondaryButtonTitle != nil){
                        CustomButton(buttonTitle: secondaryButtonTitle!, buttonAction: secondaryButtonAction, buttonColor: environment.secondaryButtonColor, buttonTextColor: environment.secondaryButtonTextColor)
                    }
                    CustomButton(buttonTitle: primaryButtonTitle, buttonAction: primaryButtonAction, buttonColor: environment.primaryButtonColor, buttonTextColor: environment.primaryButtonTextColor)
                }
                .padding(.vertical, 24)
               
            }
            .padding()
            .background(environment.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 20)
            .padding(20)
        }
    }
}

struct CustomButton : View{
    
    var buttonTitle: String
    var buttonAction: () -> ()
    var buttonColor: Color
    var buttonTextColor: Color
    
    var body: some View {
        Button{
            buttonAction()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 8).foregroundColor(buttonColor)
                
                Text(buttonTitle)
                    .font(.system(size: 16))
                    .foregroundColor(buttonTextColor)
            }
        }
        .frame(height: 56)
    }
}

struct CustomImageView : View{
    var image: String
    var body: some View {
        Image(image)
            .frame(width: 40, height: 40)
            .padding(.top, 24)
    }
}

struct TitleTextView : View{
    var title: String
    var titleColor: Color
    var textSize: CGFloat
    var body: some View {
        Text(title)
            .font(.system(size: textSize))
            .foregroundColor(titleColor)
            .padding(.top, 16)
    }
}

struct DescriptionTextView : View{
    var message: String
    var messageColor: Color
    var textSize: CGFloat
    var body: some View {
        Text(message)
            .padding(.top, textSize)
            .font(.system(size: 16))
            .foregroundColor(messageColor)
            .multilineTextAlignment(.center)
    }
}
    

struct CustomAlertView_previews: PreviewProvider{
    static var previews: some View{
        CustomAlertView(title: "Update available",image: "notification-image",secondaryButtonTitle: "Not now", primaryButtonTitle: "Update").environmentObject(
            Environment(
                descFontSize: 16.0,
                primaryButtonColor: .yellow,
                secondaryButtonColor: .gray,
                backgroundColor: .pink,
                primaryButtonTextColor: .black,
                secondaryButtonTextColor: .colorTitle,
                titleColor: .black)
        )
    }
}

