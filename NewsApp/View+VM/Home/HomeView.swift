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
    @State var isActiveBreakingNewsSerachView : Bool = false
    @State var isActiveTopNews : Bool = false
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
                            destination: SearchView(vm: SearchVM(searchText: searchText, isHideCountryNCategorySection: true)),
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
                
                //MARK: Logout Button
                Button {
                    self.vm.isShowLogOutAlert.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .foregroundColor(.red)
                }
            }
            
            //MARK: - Breaking NEWS
            HStack{
                Text("Breaking News")
                    .font(.custom(.NunitoBold, 18))
                Spacer()
                
                Button {
                    isActiveBreakingNewsSerachView.toggle()
                } label: {
                    HStack(spacing: 16){
                        Text("See All")
                            .font(.custom(.NunitoSemibold, 12))
                        Image(systemName: "arrow.right")
                            .frame(width: 10, height: 12)
                    }
                }
                .background(
                    NavigationLink (
                        destination: SearchView(vm: SearchVM(searchText: "", isHideCountryNCategorySection: false, useFor: .breakingNews)),
                        isActive: $isActiveBreakingNewsSerachView,
                        label: {})
                )
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
                    isActiveTopNews.toggle()
                } label: {
                    HStack(spacing: 16){
                        Text("See All")
                            .font(.custom(.NunitoSemibold, 12))
                        Image(systemName: "arrow.right")
                            .frame(width: 10, height: 12)
                    }
                }
                .background(
                    NavigationLink (
                        destination: SearchView(vm: SearchVM(searchText: "politics", isHideCountryNCategorySection: true, useFor: .topNews)),
                        isActive: $isActiveTopNews,
                        label: {})
                )

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
        .alert(isPresented: self.$vm.isShowLogOutAlert) {
            Alert(
                title: Text("Log Out"),
                message: Text("Are you sure you want to log out?"),
                primaryButton: .cancel(Text("Cancel")){
                    self.vm.isShowLogOutAlert = false
                },
                secondaryButton: .destructive(Text("Yes")) {
                    PersistenceController.shared.deleteUserData()
                    self.vm.isShowLogOutAlert = false
                    let contentView = ContentView()
                    UIApplication.shared.windows
                        .first { $0.isKeyWindow }?
                        .rootViewController = UIHostingController(rootView: contentView)
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
