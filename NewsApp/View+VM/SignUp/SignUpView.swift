//
//  SignUpView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - PROPERTIES
    @StateObject var vm = SignUpVM()
     
    // MARK: - BODY
     var body: some View {
         VStack{
             ScrollView() {
                 VStack(spacing: 0){
                     HStack {
                         Text("Email")
                             .font(.custom(.NunitoRegular, 16))
                         Spacer()
                     }
                     .padding(.bottom, 4)
                     
                     TextField("example@mail.com", text: $vm.email)
                         .font(.custom(.NunitoRegular, 16))
                         .padding()
                         .frame(height: 40, alignment: .leading)
                         .overlay(
                             RoundedRectangle(cornerRadius: 5)
                                 .stroke(.gray, lineWidth: 1)
                         )
                         .padding(.bottom, 20)
                     
                     HStack {
                         Text("Password")
                             .font(.custom(.NunitoRegular, 16))
                         Spacer()
                     }
                     .padding(.bottom, 4)
                     
                     SecureField("Password", text: $vm.password)
                         .font(.custom(.NunitoRegular, 16))
                         .padding()
                         .frame(height: 40, alignment: .leading)
                         .overlay(
                             RoundedRectangle(cornerRadius: 5)
                                 .stroke(.gray, lineWidth: 1)
                         )
                         .padding(.bottom, 20)
                     
                     HStack {
                         Text("Confirm Password")
                             .font(.custom(.NunitoRegular, 16))
                         Spacer()
                     }
                     .padding(.bottom, 4)
                     
                     SecureField("Re-Eneter Password", text: $vm.confirmPassword)
                         .font(.custom(.NunitoRegular, 16))
                         .padding()
                         .frame(height: 40, alignment: .leading)
                         .overlay(
                             RoundedRectangle(cornerRadius: 5)
                                 .stroke(.gray, lineWidth: 1)
                         )
                         .padding(.bottom, 30)
                     
                     Button {
                         if vm.validateFields(){
                             if vm.signUp(){
                                 let contentView = ContentView()
                                 UIApplication.shared.windows
                                     .first { $0.isKeyWindow }?
                                     .rootViewController = UIHostingController(rootView: contentView)
                             }
                         }
                     } label: {
                         HStack{
                             Spacer()
                             Text("Sign Up")
                                 .font(.custom(.NunitoBold, 16))
                                 .foregroundColor(.white)
                             Spacer()
                         }
                         .padding(12)
                         .background(Color("Secondary"))
                         .cornerRadius(10)
                     }
                 }
             }
         }
         .navigationTitle("Sign Up")
         .padding()
         .alert(isPresented: self.$vm.isShowAlert) {
             Alert(title: Text(vm.alertTitle), message: Text(vm.alertMessage))
         }
     }
 }

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
