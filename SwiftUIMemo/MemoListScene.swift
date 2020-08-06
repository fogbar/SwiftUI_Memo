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
    
    var body: some View {
        //네비게이션 만드는 법. -> NavigationView를 추가해주면 상단에 NavigationBar가 추가됨.
        NavigationView {
            //List를 하나 만들고 MemoStore에 저장되어 있는 list를 전달
            //구조체를 통해 배열에 저장되어 있는 memo가 구조체 내부의 memo 파라미터로 전달이 됨
            //List가 Swift의 테이블 뷰의 단일 column임
            List(store.list) { memo in
                VStack {
                    Text(memo.content)
                    
                    Text(memo.insertDate.description)
                }
            }
                //Swift에서는 method라고 부르지만 SwiftUI에서는 이렇게 .찍고 사용하는 Method 들을 modifier라고 부름
        .navigationBarTitle("내 메모")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
        //Preview에서도 사용할 커스텀 MemoStore를 커스텀 공유 데이터(=EnviromentObject)로 등록
            .environmentObject(MemoStore())
    }
}
