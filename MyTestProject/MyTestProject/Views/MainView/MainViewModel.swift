//
//  MainViewModel.swift
//  MyTestProject
//
//  Created by Vadim Shinkarenko on 30.04.2023.
//

import Foundation
import Combine

class MainViewModel: WithActionViewModel {
    
    let screenData: CurrentValueSubject<RoadsterModel?, Never> = .init(nil)
    
    @Published var imageArray: [String] = []
    
    private let model: Model
    
    init(model: Model) {
        print("MainViewModel was INIT")
        self.model = model
        
        super.init()
        
        Task {
            await loadScreenData()
        }
        
        bind()
    }
    
    deinit {
        print("MainViewModel was DEINIT")
    }
    
    func bind() {
        screenData
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] screenData in
                
                guard let screenData = screenData else { return }
                
                self.imageArray = screenData.flickrImages
                
            }
            .store(in: &bindings)
    }
    
    func loadScreenData() async {

        do {
            self.screenData.value = try await model.handleRoadsterGetRequest()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
