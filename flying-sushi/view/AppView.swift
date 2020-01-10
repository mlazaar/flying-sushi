//
//  AppView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        Text("Hello, App View!")
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(SessionStore())
    }
}
