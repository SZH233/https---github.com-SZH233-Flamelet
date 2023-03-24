//
//  navBarView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 12/10/2022.
//

import SwiftUI

struct navBarView: View {

    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName:"house")
                    Text("Home")
                }
            
            TaskManagerView()
                .tabItem{
                    Image(systemName:"clock")
                    Text("Task")
                }
            
            ManagerRatingList()
                .tabItem{
                    Image(systemName: "star")
                    Text("Rater")
                }
            
            PostList()
                .tabItem{
                    Image(systemName:"message")
                    Text("Forums")
                }
            
        }
    }
}

struct navBarView_Previews: PreviewProvider {
    static var previews: some View {
        navBarView()
    }
}
