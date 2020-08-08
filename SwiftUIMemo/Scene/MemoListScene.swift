//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by garlic on 2020/08/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import SwiftUI

struct MemoListScene: View {
    //SceneDelegate에서 MemoStore 인스턴스를 공유 데이터로 등록함.
    //이렇게 함으로서 뷰가 생성되는 시점에 공유 데이터 목록을 확인하고 store 객체와 동일한 형식을 가진 객체가 등록이 되어 있다면 여기에 자동으로 저장해줌. -> SwiftUI에선 이런 방식으로 하나의 데이터를 여러 뷰에서 구현
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter:DateFormatter
    //ComposeScene을 제어할때 사용하는 변수
    @State private var showComposer:Bool = false
    
    var body: some View {
        //네비게이션 만드는 법. -> NavigationView를 추가해주면 상단에 NavigationBar가 추가됨.
        NavigationView {
            //List를 하나 만들고 MemoStore에 저장되어 있는 list를 전달
            //구조체를 통해 배열에 저장되어 있는 memo가 구조체 내부의 memo 파라미터로 전달이 됨
            //List가 Swift의 테이블 뷰의 단일 column임
            List(store.list) { memo in
                //최대한 뷰 들을 잘게 쪼개는 것을 SwiftUI에서 권장함
                //이렇게 Extract를 했다면 동일한 파일보다는 다른 파일로 옮기는 것이 더 나음
                MemoCell(memo: memo)
            }
                //Swift에서는 method라고 부르지만 SwiftUI에서는 이렇게 .찍고 사용하는 Method 들을 modifier라고 부름
            .navigationBarTitle("내 메모")
                //showComposer 앞에 $문자를 붙여야 값이 복사되는 것이 아니라 binding이 전달되는데 여기서 전달한 속성은 ModalButton의 show 속성에 저장됨
                //뷰 외부의 속성을 바꾸고 싶다면 이렇게 binding 형태로 전달해야 함
                //Parameter로 전달시에 $ 문자를 붙이고, 전달 받는 쪽에서는 @Binding 형식으로 선언하는 패턴
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
                //showComposer 값이 true이면 content에 있는 클로져를 실행하여 ComposeScene 인스턴스를 모달 형식으로 리턴함
            .sheet(isPresented: $showComposer, content: {
                //preview에서 다시 눌러도 반응하지 않는 이유는 XCode preview 에러임
                ComposeScene(showComposer: self.$showComposer)
            })
        }
    }
}

fileprivate struct ModalButton:View {
    //다른 곳에 있는 값을 바꾸기 위한 속성
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
        //Preview에서도 사용할 커스텀 MemoStore를 커스텀 공유 데이터(=EnviromentObject)로 등록
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}


