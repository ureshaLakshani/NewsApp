//
//  NewsDeatilView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDeatilView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var article : Article?

    // MARK: - BODY
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .padding(8)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    Spacer()
                }

                Spacer()
            }
            .padding(.leading)
            .zIndex(1)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    
                    WebImage(url: URL(string: article?.urlToImage ?? ""))
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(.black)
                        }
                        .indicator(.activity)
                        .frame(width: UIScreen.main.bounds.width, height: 400)
                        .scaledToFill()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                        )
                    
                    VStack{
                        HStack{
                            Spacer()
                            
                        }
                        .overlay(
                            ZStack{
                                HStack{
                                    VStack(alignment: .leading, spacing: 8){
                                        Text(Helpers.parseApiDateString(article?.publishedAt ?? "", format: .EEEEDMMMYYYY))
                                            .font(.custom(.NunitoSemibold, 12))
                                        Text(article?.title ?? "N/A")
                                            .lineLimit(3)
                                            .font(.custom(.NunitoBold, 16))
                                        Text("Published by \(article?.author ?? "Unknown")")
                                            .font(.custom(.NunitoExtraBold, 10))
                                    }
                                    .padding()
                                    
                                    Spacer()
                                }
                            }
                                .frame(height: 140)
                                .background(.ultraThinMaterial)
                                .cornerRadius(16)
                                .padding()
                            
                        )
                        
                        Text(article?.content ?? "N/A")
                            .foregroundColor(.black)
                            .font(.custom(.NunitoRegular, 14))
                            .padding(.top, 80)
                            .padding()
                    }
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                            .fill(Color.white)
                    )
                    .offset(y: -100)
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .navigationBarHidden(true)
    }
}


struct NewsDeatilView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDeatilView()
    }
}
