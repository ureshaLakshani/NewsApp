//
//  ContentView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct ContentView: View {
    
    public func IsAuthenticated() -> Bool {
        return PersistenceController.shared.loadUserData() != nil
    }

    var body: some View {
        
        NavigationView{
            if IsAuthenticated(){
                HomeView()
            }else{
                SignInView()
            }
        }
    }
}
