//
//  Application.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import UIKit

class Application {
    
    static let shared = Application()
    
    enum URLs {
        static let articles = URL(string: "https://cdn.theculturetrip.com/home-assignment/response.json")!
    }
    
}
