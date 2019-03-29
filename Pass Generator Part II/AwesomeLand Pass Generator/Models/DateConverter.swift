//
//  DateConverter.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 29/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

extension Entrant {
    
    func convertDate(dateProvided: String?) -> Date? {
        if let date = dateProvided {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateStringProvided = dateFormatter.date(from: date)
            
            guard let convertedDate = dateStringProvided else {
                print("Date not convertable")
                return nil
            }
            return convertedDate
        } else {
            print("No birthday supplied for age check")
            return nil
        }
    }
    
}
