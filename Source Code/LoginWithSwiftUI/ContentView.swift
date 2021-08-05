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
    
    @State var email: String = ""
    @State var password: String = ""
    init() {
          UIScrollView.appearance().bounces = false
       }
    var body: some View {
        ScrollView {
        VStack() {
            HStack {
                Spacer()
            }
            WelcomeText()
            UserImage()
            
            TextField("Email", text: $email)
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
                if isValidate() {
                    alert(text: "Login successfully")
                }
            }) {
                LoginButtonContent()
            }
            Spacer()
        }
        }
        .padding()
        .background(lightBlueColor)
        .edgesIgnoringSafeArea(.all)
    }
    func isValidate() -> Bool {
        if !self.email.isEmpty {
            
        }else {
            alert(text: "Please enter email")
            return false
        }
        if self.email.isValidEmail {
            
        }else {
            alert(text: "Please enter valid email")
            return false
        }
        if !self.password.isEmpty {
            
        }else {
            alert(text: "Please enter password")
            return false
        }
        if self.password.isValidPassword {
            
        }else {
            alert(text: "Password should be atleast 6 character and contain 1 capital,numaric and spacial character")
            return false
        }
        return true
    }
    private func alert(text:String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        showAlert(alert: alert)
    }
    func showAlert(alert: UIAlertController) {
        if let controller = topMostViewController() {
            controller.present(alert, animated: true)
        }
    }
    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
    }

    private func topMostViewController() -> UIViewController? {
        guard let rootController = keyWindow()?.rootViewController else {
            return nil
        }
        return topMostViewController(for: rootController)
    }

    private func topMostViewController(for controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return topMostViewController(for: presentedController)
        } else if let navigationController = controller as? UINavigationController {
            guard let topController = navigationController.topViewController else {
                return navigationController
            }
            return topMostViewController(for: topController)
        } else if let tabController = controller as? UITabBarController {
            guard let topController = tabController.selectedViewController else {
                return tabController
            }
            return topMostViewController(for: topController)
        }
        return controller
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

     
