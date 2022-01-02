//
//  ContentView.swift
//  CustomTabView
//
//  Created by Ierchenko Anna  on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    
        init() {
            UITabBar.appearance().barTintColor = .systemBackground
            UINavigationBar.appearance().barTintColor = .systemBackground
        }
    
    @State var selectedIndex = 0
    @State var shouldShowModel = false
    
    let tabBarImageName = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                
                Spacer()
                .fullScreenCover(isPresented: $shouldShowModel, content: {
                    Button(action: {shouldShowModel.toggle()}, label: {
                        Text("Fullscreen cover")
                    })
                   
                })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ScrollView {
                            ForEach(0..<100) { num in
                            Text("\(num)")
                            }
                        }
                            .navigationTitle("First Tab")
                    }
                case 1:
                    ScrollView {
                        Text("TEXT")
                    }
                default:
                    NavigationView {
                    Text("Remaining tabs")
                    }
                }
            }
 //           Spacer()
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) {num in
                    Button(action: {
                        
                        if num == 2 {
                            shouldShowModel.toggle()
                            return
                        }
                        
                        selectedIndex = num
                    }, label: {
                    Spacer()
                        if num == 2 {
                            Image(systemName: tabBarImageName[num])
                                .font(.system(size: 64, weight: .bold))
                                .foregroundColor(.red)
                          
                        } else {
                    Image(systemName: tabBarImageName[num])
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                    Spacer()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
//    TabView {
//Text("First")
//    .tabItem {
//        Image(systemName: "person")
//        Text("first")
//    }
//    Text("Second")
//        .tabItem {
//            Image(systemName: "gear")
//            Text("second")
//        }
//}
