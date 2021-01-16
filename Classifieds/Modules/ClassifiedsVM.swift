//
//  ClassifiedsVM.swift
//  Classifieds
//
//  Created by Sateesh on 15/01/2021.
//

import Foundation
import RxSwift
import RxCocoa

class ClassifiedsViewModel {
    
    let classifieds: BehaviorRelay<[Classified]> = BehaviorRelay(value: [])
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    func fetchClassieds()  {
        
        self.isLoading.accept(true)
        
        let request = Request(path: "\(AppUrl.classifiedsList)")
        Network.shared.send(request) {[weak self] (result: Result<ClassifiedsListModel, Error>) in
            self?.isLoading.accept(false)
            switch result {
            case .success(let response):
                print("Success")
                if let results = response.results {
                    self?.classifieds.accept(results)
                }

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func numberOfClassifieds() -> Int {
        return self.classifieds.value.count
    }
    
    func classifiedForIndexpath(_ indexpath: IndexPath) -> Classified {
        return self.classifieds.value[indexpath.row]
    }
}
