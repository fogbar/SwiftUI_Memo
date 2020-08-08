//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/08.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var memoStore:MemoStore
    @State private var content:String = ""
    
    @Binding var showComposer:Bool
    
    var body: some View {
        NavigationView {
            VStack {
                //$ 문자를 사용하면 content 속성과 textField가 바인딩 되고 textField에 문자를 입력하면 content 속성에 자동으로 저장됨
                //반대로 content 속성에 문자열을 저장하면 TextField에도 동일한 문자열이 표시됨
                TextField("", text: $content)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer))
        }
    }
}

fileprivate struct DismissButton:View {
    @Binding var show:Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}

fileprivate struct SaveButton:View {
    @Binding var show:Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(showComposer: .constant(false))
        .environmentObject(MemoStore())
    }
}
