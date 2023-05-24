//
//  ProfileView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("ChatView")
            }
            .padding(.bottom, 50)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: .init(model: .emptyMock))
    }
}

