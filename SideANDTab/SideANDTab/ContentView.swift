//
//  ContentView.swift
//  SideANDTab
//
//  Created by Daniel Watson on 16/06/2021.
//

import SwiftUI


class ContentViewModel: ObservableObject {
    @Published var selectedTab = "One"
    @Published var showMenu = false
}

struct ContentView: View {
    
    @StateObject var VM = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                TabsView(VM: VM)
                if self.VM.showMenu {
                    SideMenuView(OVM: VM)
                }
            }
            .navigationBarTitle("Side Menu", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.VM.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }
    }
}


struct TabsView: View {
    
    @ObservedObject var VM: ContentViewModel
    
    var body: some View {
        TabView(selection: $VM.selectedTab) {
            Ingredients()
                .tabItem{
                    Label("Ingredients", systemImage: "square.and.pencil")
                }.tag("Ingredients")
            Suppliers()
                .tabItem{
                    Label("Suppliers", systemImage: "square.and.pencil")
                }.tag("Suppliers")
            Purchases()
                .tabItem{
                    Label("Purchases", systemImage: "square.and.pencil")
                }.tag("Purchases ")
        }
    }
}


struct SideMenuView: View {
    
    @ObservedObject var OVM: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            SettingsNav()
            RestaurantNav()
            MiseEnPlaceNav()
            HomeNav()
            RecipesNav()
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 23/255, blue: 32/255))
    }
}

struct SettingsNav: View {
    var body:  some View{
        NavigationLink(destination: UserSettings()) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
    }
}
struct RestaurantNav: View {
    var body:  some View{
        NavigationLink(destination: Restaurant()) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Restaurant")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
    }
}

struct MiseEnPlaceNav: View {
    var body:  some View{
        NavigationLink(destination: MiseEnPlace()) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("MiseEnPlace")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
    }
}
struct HomeNav: View {
    var body:  some View{
        NavigationLink(destination: Home()) {
            HStack {
                Image(systemName: "house")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("home")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
    }
}

struct RecipesNav: View {
    var body:  some View{
        NavigationLink(destination: Recipes()) {
            HStack {
                Image(systemName: "house")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("recipes")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
    }
}
