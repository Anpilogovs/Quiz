//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Сергей Анпилогов on 17.11.2022.
//

import Foundation

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        
        switch self {
        case .dog:
            return "You lika to be with friends and you are a faithful friend"
        case .cat:
            return "You like you, you are very gentle and soft"
        case .rabbit:
            return "You are very fast and love carrots"
        case .turtle:
            return "Your power is in wisdom and you are very slow"
        }
    }
}
