//
//  DateExt.swift
//  News-SUI
//
//  Created by KsArT on 18.11.2024.
//

import Foundation

extension Date {
    func toString() -> String {
        formatted(.dateTime.hour().minute().day().month().year())
    }
}

extension String {
    func toDateFromIso8601() -> Date {
        DateFormater.toDate(from: self) ?? Date.distantPast
    }
}

enum DateFormater {
    private static let isoFormatter: ISO8601DateFormatter = {
        let formater = ISO8601DateFormatter()
        formater.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        return formater
    }()
    
    public static func toDate(from string: String) -> Date? {
        Self.isoFormatter.date(from: string)
    }
    
}
