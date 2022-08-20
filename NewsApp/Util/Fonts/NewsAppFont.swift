//
//  NewsAppFont.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-20.
//

import Foundation
import SwiftUI

enum NewsAppFont: String{
    case NunitoBlack = "Nunito-Black"
    case NunitoBold = "Nunito-Bold"
    case NunitoExtraBold = "Nunito-ExtraBold"
    case NunitoLight = "Nunito-Light"
    case NunitoRegular = "Nunito-Regular"
    case NunitoSemibold = "Nunito-SemiBold"
    case NewYorkSmallBold = "NewYorkSmall-Bold"
    case NewYorkSmallSemiBold = "NewYorkSmall-Semibold"
}

extension Font {
    static func custom(_ name: NewsAppFont, _ size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}
