//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import SwiftUI

//*Indentifiable = 데이터 목록을 테이블 뷰나 컬렉션 뷰에 쉽게 바인딩 가능
//*ObservableObject = 반응형 UI를 구현하기 위해 필요
class Memo: Identifiable, ObservableObject {
    //id: Identifiable이 요구하는 속성 -> 메모를 유일하게 구분시 사용
    let id:UUID
    //content에는 메모 내용을 추가
    //Published 특성을 추가하면 새로운 값이 저장될 때마다 바인딩 되어있는 UI가 자동으로 업데이트 됨
    @Published var content:String
    //insertDate에는 메모를 생성한 날짜 추가
    let insertDate: Date
    
    //위 세가지 property 들을 초기화하는 초기화기 구현
    init(id:UUID = UUID(), content:String, insertDate:Date = Date()) {
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    //id 속성을 비교하는 method 구현
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.id == rhs.id
    }
}
