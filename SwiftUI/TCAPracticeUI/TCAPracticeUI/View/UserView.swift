//
//  UserView.swift
//  TCAPracticeUI
//
//  Created by gnksbm on 2023/09/15.
//

import SwiftUI
import ComposableArchitecture

struct UserView: View {
    let store: StoreOf<UserStore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack {
                ScrollView {
                    Text("\(viewStore.user.name)")
                        .font(.largeTitle)
                        .padding(5)
                    Text("\(viewStore.user.phoneNumber)")
                    UserSubView()
                    NavigationLink {
                    } label: {
                        ZStack {
                            HStack {
                                Spacer()
                                Text("자세히 보기")
                                Spacer()
                            }
                            .borderedCaption()
                            .padding()
                        }
                    }
                    Image("advertisement")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet.rectangle.portrait")
                                    .imageScale(.large)
                                    .padding()
                                Text("주소 관리")
                                    .frame(height: 60)
                                Spacer()
                            }
                        }
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image(systemName: "heart")
                                    .imageScale(.large)
                                    .padding()
                                Text("즐겨찾기")
                                    .frame(height: 60)
                                Spacer()
                            }
                        }
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image(systemName: "tag")
                                    .imageScale(.large)
                                    .padding()
                                Text("할인 쿠폰")
                                    .frame(height: 60)
                                //                            if viewStore.coupons.count > 0 {
                                Image(systemName: "1.circle.fill")
                                    .foregroundColor(.blue)
                                //                            }
                                Spacer()
                            }
                        }
                        
                        HStack {
                            Image(systemName: "tag")
                                .imageScale(.large)
                                .padding()
                            Text("CEats 머니")
                                .frame(height: 60)
                            Spacer()
                            Spacer()
                            Text("\(viewStore.user.cEatsMoney)원")
                            Spacer()
                        }
                    }
                    .foregroundColor(.primary)
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(
            store: Store(initialState: UserStore.State(user: .sampleData)) {
                UserStore()
            }
        )
    }
}

struct UserSubView: View {
    var body: some View {
        HStack(alignment: .center ,spacing: 10) {
            VStack {
                Text("0")
                    .font(.largeTitle)
                    .bold()
                Text("내가 남긴리뷰")
                    .font(.footnote)
            }
            .padding()
            VStack(alignment: .center) {
                Text("0")
                    .font(.largeTitle)
                    .bold()
                Text("도움이 됐어요")
                    .font(.footnote)
            }
            .padding()
            VStack {
                Text("0")
                    .font(.largeTitle)
                    .bold()
                Text("즐겨찾기")
                    .font(.footnote)
            }
            .padding()
        }
    }
}
