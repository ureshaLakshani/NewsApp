//
//  HomeView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    @State var searchText : String = ""
    @State var isActiveSearchView : Bool = false
    @State var isActiveNewsDetailView : Bool = false
    @StateObject var vm = HomeVM()

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
        
            //MARK: - TOP BAR
            HStack(spacing: 16){
                
                //MARK: Search Bar
                HStack(spacing: 0){
                    TextField("Dogecoin to the Moon...", text: $searchText)
                        .font(.custom(.NunitoSemibold, 12))

                    Button {
                        isActiveSearchView.toggle()
                    } label: {
                        Image("search")
                    }
                    .background(
                        NavigationLink (
                            destination: SearchView(),
                            isActive: $isActiveSearchView,
                            label: {})
                    )

                }
                .padding()
                .frame(height: 32, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray.opacity(0.4), lineWidth: 0.5)
                )
                
            }
            
            //MARK: - Breaking NEWS
            HStack{
                Text("Breaking News")
                    .font(.custom(.NunitoBold, 18))
                Spacer()
                
                Button {
                    
                } label: {
                    HStack(spacing: 16){
                        Text("See All")
                            .font(.custom(.NunitoSemibold, 12))
                        Image(systemName: "arrow.right")
                            .frame(width: 10, height: 12)
                    }
                }
            }
            .padding(.top, 24)
            .padding(.bottom, 16)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(vm.breakingNews, id: \.id){ article in
                        BreakingNewsCardView(article: article)
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
            
            //MARK: - TOP NEWS
            HStack{
                Text("Top News")
                    .font(.custom(.NunitoBold, 18))
                Spacer()
                
                Button {
                    
                } label: {
                    HStack(spacing: 16){
                        Text("See All")
                            .font(.custom(.NunitoSemibold, 12))
                        Image(systemName: "arrow.right")
                            .frame(width: 10, height: 12)
                    }
                }

            }
            .padding(.top, 24)
            .padding(.bottom, 16)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(vm.topNews, id: \.id){ article in
                        TopNewsCardView(article: article)
                            .onTapGesture {
                                vm.selectedArticle = article
                                isActiveNewsDetailView.toggle()
                            }
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 15)
        .padding(.top, 16)
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            vm.getBreakingNews()
            vm.getTopNews()
        }
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
