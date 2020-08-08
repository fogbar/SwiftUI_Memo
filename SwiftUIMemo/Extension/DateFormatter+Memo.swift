//
//  DateFormatter+Memo.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/08.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
}

extension DateFormatter: ObservableObject {
    
}
