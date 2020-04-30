//
//  ContentView.swift
//  demoSwiftUIApp
//
//  Created by Devubha Manek on 30/04/20.
//  Copyright © 2020 Devubha Manek. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightBlueColor = Color(red: 212.0/255.0, green: 235.0/255.0, blue: 242.0/255.0, opacity: 1.0)
let lightPinkColor = Color(red: 230.0/255.0, green: 173.0/255.0, blue: 188.0/255.0, opacity: 1.0)
let DarkPinkColor = Color(red: 212.0/255.0, green: 114.0/255.0, blue: 140.0/255.0, opacity: 1.0)

struct ContentView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack() {
            HStack {
                Spacer()
            }
            WelcomeText()
            UserImage()
            
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 15)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            
            HStack() {
                Spacer()
                Button(action: {print("Forgot Password tapped")}) {
                    ForgotPasswordContent()
                } .padding([.trailing], 0)
            }.alignmentGuide(.trailing, computeValue: {_ in 0})
            
            Button(action: {
                print("Log in Button tapped")
            }) {
                LoginButtonContent()
            }
            Spacer()
        }
        .padding()
        .background(lightBlueColor)
     
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
}
#endif

struct WelcomeText : View {
    var body: some View {
        return Text("Welcome!")
            .font(.system(size: 20))
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .padding(.top, 20)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
            .cornerRadius(100)
            .padding(.bottom, 30)
    }
}

struct ForgotPasswordContent : View {
    var body: some View {
        return Text("Forgot Password?")
            .font(.system(size: 15))
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .alignmentGuide(.trailing, computeValue: {_ in 0})
            .frame(height: 30)
            .padding(.bottom, 20)
            .background(Color.clear)
        
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 45)
            .background(DarkPinkColor)
            .cornerRadius(15.0)
    }
}

     
