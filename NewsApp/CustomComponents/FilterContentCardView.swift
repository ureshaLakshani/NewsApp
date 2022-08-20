//
//  FilterContentCardView.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import SwiftUI

struct FilterContentCardView: View {
    
    // MARK: - PROPERTIES
    var filter : Filter
    var selectedAction: (() -> ())?
    
    // MARK: - BODY
    var body: some View {
        VStack{
            Button {
                selectedAction?()
            } label: {
                Text(filter.name)
                    .foregroundColor( filter.isSelected ? .white : .black)
                    .font(.custom(.NunitoSemibold, 12))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        ZStack{
                            filter.isSelected ? Color("Primary") : Color.white
                            RoundedRectangle(cornerRadius: 6)
                                .stroke( filter.isSelected ? .red : .gray, lineWidth: 1)
                            
                        }
                            .cornerRadius(6)
                    )
            }
        }
    }
}

struct FilterContentCardView_Previews: PreviewProvider {
    static var previews: some View {
        FilterContentCardView(filter: Filter(id: UUID(), name: "Sample", isSelected: false))
            .previewLayout(.sizeThatFits)
    }
}
