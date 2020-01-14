//
//  AppView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

extension Color {

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}

struct AppView: View {
    
    @EnvironmentObject var session: SessionStore
    @State var showMenu = false
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = Color.backgroundColor.uiColor()
        
    }
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100{
                    withAnimation{
                        self.showMenu=false
                    }
                }
                
        }
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Color.buttonColor.edgesIgnoringSafeArea(.all)
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x:self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView().frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Welcome \(String(session.session!.displayName ?? " App"))", displayMode: .inline)
            .navigationBarItems(leading: (Button(action: {
                withAnimation{
                    self.showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                }
            
            ))
        }
        
    }
    
}

struct MainView: View {
    @Binding var showMenu: Bool

    var body: some View {
        OrderItemView()
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(SessionStore())
    }
}
