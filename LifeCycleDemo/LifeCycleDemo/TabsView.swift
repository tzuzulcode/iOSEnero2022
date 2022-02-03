//
//  TabsView.swift
//  LifeCycleDemo
//
//  Created by Tzuzul Rosas on 02/02/22.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView{
            TabView{
                FirstTabView()
                    .tabItem{
                        Image(systemName: "01.circle")
                        Text("First")
                    }
                SecondTabView()
                    .tabItem{
                        Image(systemName: "02.circle")
                        Text("Second")
                    }
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
