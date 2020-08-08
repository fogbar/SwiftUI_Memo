//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/08.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import SwiftUI

struct MemoCell: View {
    //ObservedObject를 넣으면 메모 객체가 업데이트 되는 시점마다 뷰가 새롭게 그려짐. 그래서 항상 최신 데이터를 표시함
    //ObservedObject가 Parameter 역할을 하는 듯 함
    @ObservedObject var memo : Memo
    //formatter의 경우에도 Text에서 formatter를 사용하는데 struct가 나뉘어져 있기 때문에 여기에서도 다시 선언을 해줘야 내부적으로 사용가능함.
    @EnvironmentObject var formatter:DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text("\(memo.insertDate, formatter: self.formatter)")
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
