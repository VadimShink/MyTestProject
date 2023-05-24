//
//  MainView.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    let sizeWidth = UIScreen.main.bounds.width - 16
//    let sizeHeight = sizeWidth / 1.5
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                TabView {
                    
                    ForEach(viewModel.imageArray, id: \.self) { imageString in
                        
                        AsyncImage(url: URL(string: imageString)) { image in
                            
                            if let image = image.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: sizeWidth, height: sizeWidth / 1.5)
                                    .clipped()
                            }
                        }
                    }
                }
                .tabViewStyle(.page)
                .frame(width: sizeWidth, height: sizeWidth / 1.5)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .init(model: .emptyMock))
    }
}
