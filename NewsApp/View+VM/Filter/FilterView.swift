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
    var selectedFilters : ((_ country: String, _ langugae: String, _ category: String) -> ())?

    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)

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
                    if !vm.isHideCountryNCategorySection{
                        HStack{
                            Text("Category")
                                .font(.custom(.NunitoSemibold, 14))
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 8)
                        
                        LazyVGrid(columns: columnsForCategory, alignment: .leading, spacing: 5) {
                            ForEach(vm.categories, id: \.id) { item in
                                FilterContentCardView(filter: item){
                                    vm.selectCategory(filter: item)
                                }
                            }
                        }
                    }
                    
                    //MARK: - Country
                    if !vm.isHideCountryNCategorySection{
                        HStack{
                            Text("Country")
                                .font(.custom(.NunitoSemibold, 14))
                            Spacer()
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 8)
                        
                        LazyVGrid(columns: columnsForCountriesNLanguage, alignment: .leading, spacing: 5) {
                            ForEach(vm.countries, id: \.id) { item in
                                FilterContentCardView(filter: item){
                                    vm.selecCountry(filter: item)
                                }
                            }
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
                        ForEach(vm.language, id: \.id) { item in
                            FilterContentCardView(filter: item){
                                vm.selectLanguage(filter: item)
                            }
                        }
                    }
                    .padding(.bottom, 32)
                    
                    HStack{
                        Button {
                            vm.resetFilters()
                            selectedFilters?("", "", "")
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
                            selectedFilters?(vm.selectedCountry, vm.selectedLanguage, vm.selectedCategory)
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
                .background(
                   RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                    .fill(Color.white)
                )
                
            }
        }
        .ignoresSafeArea()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(vm: FilterVM(isHideCountryNCategorySection: false))
    }
}
