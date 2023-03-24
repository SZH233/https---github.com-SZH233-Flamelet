//
//  menu.swift
//  DouBanDemo
//
//  Created by Keyu LI on 18/8/2022.
//

import SwiftUI

struct ManagerRatingList: View {
    @StateObject var managerViewModel:ManagerViewModel = ManagerViewModel()
    
    
    var body: some View {
        

        NavigationView{
            List(managerViewModel.ManagerList){manager in
                NavigationLink(destination: ManagerRating(manager: manager).environmentObject(managerViewModel)){

                    ManagerView(manager: manager)
                }
            }
//            .onAppear(perform: managerViewModel.loadData)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Anonymous Employer Rater")

        }
        
    }
}

struct ManagerRatingList_Previews: PreviewProvider {
    
//    var managerView = ManagerViewModel()
    static var previews: some View {
        ManagerRatingList()
    }
}

