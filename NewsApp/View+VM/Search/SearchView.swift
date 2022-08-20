//
//  SearchView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - PROPERTIES
    @State var isShowFilerPanel : Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject var vm : SearchVM
    @State var isActiveNewsDetailView : Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0){
                
                //MARK: - Search Bar
                HStack(spacing: 16){
                    
                    //MARK: Back Button
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                    
                    //MARK: Search Bar
                    HStack(spacing: 0){
                        
                        TextField("Search", text: $vm.searchText)
                            .font(.custom(.NunitoSemibold, 12))
                        
                        Button {
                            self.vm.searchResult = []
                            if self.vm.useFor == .breakingNews{
                                vm.getAllBreakingNews()
                            }else{
                                vm.findContent()
                            }
                        } label: {
                            Image("search")
                        }
                        
                    }
                    .padding()
                    .frame(height: 32, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.4), lineWidth: 0.5)
                    )
                    
                    //MARK: Filter Button
                    Button {
                        isShowFilerPanel.toggle()
                    } label: {
                        Image("filter")
                    }
                }
                .padding(.bottom, 20)
                
                //MARK: - NEWS Content
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack{
                        ForEach(vm.searchResult, id: \.id){ article in
                            TopNewsCardView(article: article)
                                .onAppear {
                                    // Pagination Handle
                                    if vm.searchResult.count < vm.totalResult{
                                        vm.page += 1
                                        if self.vm.useFor == .breakingNews{
                                            vm.getAllBreakingNews()
                                        }else{
                                            vm.findContent()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    vm.selectedArticle = article
                                    isActiveNewsDetailView.toggle()
                                }
                        }
                    }
                }
                .background(
                    NavigationLink (
                        destination: NewsDeatilView(article: vm.selectedArticle),
                        isActive: $isActiveNewsDetailView,
                        label: {})
                )
                
                Spacer()
            }
            .navigationBarHidden(true)
            .padding(.horizontal, 16)
            .ignoresSafeArea(.all, edges: .bottom)
           
            if isShowFilerPanel{
                withAnimation {
                    FilterView(){
                        isShowFilerPanel.toggle()
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(vm: SearchVM())
    }
}
