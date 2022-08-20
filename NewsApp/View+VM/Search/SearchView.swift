//
//  SearchView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - PROPERTIES
    @State var searchText : String = ""
    @State var isShowFilerPanel : Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
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
                        
                        TextField("Dogecoin to the Moon...", text: $searchText)
                            .font(.custom(.NunitoSemibold, 12))
                        
                        Button {
                            
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
                    VStack{
                        ForEach(1...10, id: \.self){ _ in
                            TopNewsCardView()
                        }
                    }
                }
                
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
        SearchView()
    }
}
