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
