//
//  PostList.swift
//  FlameLet DEMO
//
//  Created by 宋子豪 on 2022/9/28.
//

import Foundation
import SwiftUI

struct PostList: View {
//    @StateObject var shareTime:Forum = Forum()
//    @StateObject var treeHole: TreeHoleForum = TreeHoleForum()
    @EnvironmentObject var shareTime: Forum
    @EnvironmentObject var treeHole: TreeHoleForum
    @EnvironmentObject private var login:loginViewModel
    @State var ispresented = false
    @State var offsetX = CGFloat(-80)
    
    var body: some View {
        ZStack {
            VStack {
                Text("Shanti Annoymous Forum")
                    .font(.headline)
                    .frame(width: 380, height: 40, alignment: .center)
                    .padding(10)
                    .background(Color.ui.Grey)
                VStack {
                    HStack {
                        Text("Share Time")
                            .font(.body)
                            .frame(width: 150, height: 20, alignment: .center)
                        Text("Tree Hole")
                            .font(.body)
                            .frame(width: 150, height: 20, alignment: .center)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.ui.Grey)
                    .offset(y: -10)
                    Rectangle()
                        .fill(Color.ui.FlameOrange)
                        .frame(width: 80, height: 5, alignment: .leading)
                        .offset(x: offsetX, y: -18)
                }
                TabView {
                    ShareTime().environmentObject(shareTime)
                        .environmentObject(treeHole)
                        .environmentObject(login)
                        .onAppear(perform: {
                            offsetX = -80
                        })
                    TreeHole().environmentObject(treeHole)
                        .environmentObject(shareTime)
                        .environmentObject(login)
                        .onAppear(perform: {
                            offsetX = 80
                        })
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}

//var post2:Post = Post(id: 1, title: "HATThe Iced American ", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0)
//
//
//var posts1:[Post] = [
//    Post(id: 1, title: "HATThe Iced American ", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 2, title: "", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 3, title: "didn't catch you", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 1, title: "HATThe Iced American ", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 2, title: "catch you", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 3, title: "didn't catch you", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 1, title: "HATThe Iced American ", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 2, title: "catch you", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0),
//    Post(id: 3, title: "didn't catch you", content: "The Icedtastes great. Maybe I'll try their creme de la creme next time!The Iced American tastes great. Maybe I'll try their creme de la creme next time!", like: "14", poster: "ZIHAOSONG", dependency: 0)
//]

//struct PostList_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) {
//            deviceName in
//                PostList()
//                    .previewDevice(PreviewDevice(rawValue: deviceName))
//                    .previewDisplayName(deviceName)
//        }
//    }
//}
