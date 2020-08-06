//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

class MemoStore: ObservableObject {
    //배열을 Published로 선언하면 배열을 업데이트 할때마다 바인딩 되어있는 뷰도 함께 업데이트 됨
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Lorem Ipsum 1"),
            Memo(content: "Lorem Ipsum 2"),
            Memo(content: "Lorem Ipsum 3")
        ]
    }
    
    //---- 기본적인 CRUD 코드 구현 ----
    //*CRUD란? :
    /*  이름       기능       SQL
     C: Create -> 생성 ->  insert
     R: Read  ->  읽기 ->  select
     U: Update -> 갱신 ->  update
     D: Delete -> 삭제 ->  delete
     */
    
    //1. 입력한 메모를 파라미터로 받은 다음 리스트 배열에 저장
    //새로운 메모는 항상 0번 index에 추가
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    //2. update 메소드
    //파라미터로 메모와 편집된 내용을 받은 후 body에서 content 속성에 그대로 저장
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {return}
        memo.content = content
    }
    
    //3. delete 메소드
    //메모 인스턴스를 받는 버전과 indexSet을 받는 버전을 각각 구현
    
    //3-1) 메모 인스턴스가 전달되면 배열에서 바로 삭제
    func delete(memo: Memo) {
        self.list.removeAll { $0 == memo }
    }
    
    //3-2) indexSet이 전달되면 for-in 문으로 반복하면서 배열에서 삭제
    func delete(set: IndexSet) {
        for index in set {
            self.list.remove(at: index)
        }
    }
}
