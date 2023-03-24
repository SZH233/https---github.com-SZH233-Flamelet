////
////  NewPost.swift
////  FlameLet DEMO
////
////  Created by 宋子豪 on 2022/9/29.
////
//
//import SwiftUI
//
//
//struct NewPost: View {
//    @EnvironmentObject var forum: Forum
//    @State private var titleText = "Please input your title"
//    @State private var contentText = "Share what you want to say"
//
//    var body: some View {
//        VStack {
//            Image("downArrow")
//                .resizable()
//                .frame(width: 45, height: 22.08, alignment: .center)
//            VStack(alignment: .leading) {
//                Text("Title")
//                    .font(.headline)
//                    .frame(width: 300, height: 50, alignment: .leading)
//                    .foregroundColor(.white)
//                TextEditor(text: $titleText)
//                    .keyboardType(.phonePad)
//                    .frame(width: 300, height: 50, alignment: .leading)
//                    .cornerRadius(10)
//            }
//            VStack(alignment: .leading) {
//                Text("Content")
//                    .font(.headline)
//                    .frame(width: 300, height: 50, alignment: .leading)
//                    .foregroundColor(.white)
//                TextEditor(text: $contentText)
//                    .keyboardType(.phonePad)
//                    .frame(width: 300, height: 200, alignment: .leading)
//                    .cornerRadius(10)
//            }
//            Button("Submit", action: {
//                forum.createPost(title: titleText, content: contentText, like: 0, poster: "test3_poster", imageIDs: "ID2")
//                print("*&*&*&*&*&*&*(&(*&(*&(*&(*&(")
//            })
//            .foregroundColor(.white)
//            .font(.system(size: 15).bold())
//            .frame(width: 100, height: 50, alignment: .center)
//            .background(Color.ui.LoginColor)
//            .cornerRadius(25)
//        }
//        .frame(width: 390, height: 500, alignment: .center)
//        .padding(.bottom, UIScreen.main.bounds.height - newPostHeight)
//        .edgesIgnoringSafeArea(.all)
//        .shadow(color: Color.black.opacity(offsetY != 0 ? 0.1:0), radius: 5, x: 5, y: 0)
//        .offset(y: -offsetY)
//        .background(
//            Color.ui.FlameOrange.opacity(offsetY == 0 ? 1 : 0)
//                .ignoresSafeArea(.all, edges: .vertical)
//                .onTapGesture {
//                    withAnimation {
//                        offsetY = -newPostHeight
//                    }
//                }
//        )
//        .cornerRadius(20)
//    }
//}
//
////struct NewPost_Previews: PreviewProvider {
////    static var previews: some View {
////        NewPost(newPostHeight: UIScreen.main.bounds.height - 60, offsetY: -UIScreen.main.bounds.height + 60)
////    }
////}
