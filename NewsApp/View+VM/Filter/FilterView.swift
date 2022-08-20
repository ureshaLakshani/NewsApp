//
//  FilterView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct FilterView: View {
    
    // MARK: - PROPERTIES
    @StateObject var vm = FilterVM()
    let columnsForCategory = [GridItem(.adaptive(minimum: 100))]
    let columnsForCountriesNLanguage = [GridItem(.adaptive(minimum: 50))]
    var cancelAction: (() -> ())?
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Spacer()
                
                VStack(spacing: 0){
                    
                    //MARK: Header
                    HStack{
                        Text("Filter")
                            .font(.custom(.NunitoBold, 22))
                        
                        Spacer()
                        
                        Button {
                            cancelAction?()
                        } label: {
                            HStack{
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            }
                            .foregroundColor(.black)
                            .padding(5)
                            .background(Color("Primary"))
                            .cornerRadius(10)
                            
                        }
                    }
                    
                    //MARK: - Category
                    HStack{
                        Text("Category")
                            .font(.custom(.NunitoSemibold, 14))
                        Spacer()
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 8)
                    
                    LazyVGrid(columns: columnsForCategory, alignment: .leading, spacing: 5) {
                        ForEach(vm.categories, id: \.id) { item in

                        }
                    }
                   
                    //MARK: - Country
                    HStack{
                        Text("Country")
                            .font(.custom(.NunitoSemibold, 14))
                        Spacer()
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 8)
                    
                    LazyVGrid(columns: columnsForCountriesNLanguage, alignment: .leading, spacing: 5) {
                        ForEach(vm.countries, id: \.self) { item in
                        }
                    }
                    
                    //MARK: - Language
                    HStack{
                        Text("Language")
                            .font(.custom(.NunitoSemibold, 14))
                        Spacer()
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 8)
                    
                    LazyVGrid(columns: columnsForCountriesNLanguage, alignment: .leading, spacing: 5) {
                        ForEach(vm.language, id: \.self) { item in
                        }
                    }
                    .padding(.bottom, 32)
                    
                    
                    HStack{
                        Button {
                            
                        } label: {
                            HStack{
                                Spacer()
                                Image(systemName: "xmark.bin")
                                    .foregroundColor(.black)
                                Text("Reset")
                                    .font(.custom(.NunitoBold, 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.black, lineWidth: 1)
                            )
                        }
                        
                        Button {
                            
                        } label: {
                            HStack{
                                Spacer()
                                Text("Apply")
                                    .font(.custom(.NunitoBold, 16))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(12)
                            .background(Color("Secondary"))
                            .cornerRadius(16)
                        }
                    }
                    .padding(.bottom, 25)
                    
                }
                .padding(.top)
                .padding(.horizontal, 15)
                
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
