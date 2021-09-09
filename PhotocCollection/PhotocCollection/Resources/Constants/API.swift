//
//  Constants.swift
//  InterviewTask
//
//

import Foundation


enum API{
    
    case photo(number: Int)
    
    var url: URL {
        switch self {
        case .photo(let number):
            return URL(string: "https://picsum.photos/\(number)")!
        }
    }
}
