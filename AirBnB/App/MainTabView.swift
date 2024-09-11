//
//  ContentView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreVIew()
                .tabItem {
                Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            Text("Fav")
                .tabItem {
                Image(systemName: "heart")
                    Text("Favorites")
                }
            ProfileView()
                .tabItem {
                Image(systemName: "person")
                    Text("Person")
                }            
        }
    }
}

#Preview {
    NavigationStack{
        MainTabView()
    }
}
