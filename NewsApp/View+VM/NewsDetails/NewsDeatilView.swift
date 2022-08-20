//
//  NewsDeatilView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI

struct NewsDeatilView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
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
                    Image("Rectangle 60")
                        .resizable()
                        .frame(height: 400)
                    
                    VStack{
                        HStack{
                            Spacer()
                            
                        }
                        .overlay(
                            ZStack{
                                HStack{
                                    VStack(alignment: .leading, spacing: 8){
                                        Text("Sunday, 9 May 2021")
                                            .font(.custom(.NunitoSemibold, 12))
                                        Text("Crypto investors should be prepared to lose all their money, BOE governor says")
                                            .lineLimit(3)
                                            .font(.custom(.NunitoBold, 16))
                                        Text("Published by Ryan Browne")
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
                        
                        Text("s “have no intrinsic value” and people who invest in them should be prepared toes “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said. s “have no intrinsic value” and people who invest in them should be prepared toes “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.")
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
