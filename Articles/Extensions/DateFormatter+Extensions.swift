//
//  DateFormatter+Extensions.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import Foundation

extension DateFormatter {
    
    static var creationFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }()
    
    static var creationFormatterDisplayed: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        return formatter
    }()
    
}
