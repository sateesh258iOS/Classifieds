//
//  NetworkTask.swift
//  Infra
//
//  Created by NewZenTech on 5/23/19.
//  Copyright © 2019 NewZenTech. All rights reserved.
//

import Foundation


class NetworkTask {
    
    private var task: URLSessionTask?
    private var cancelled = false

    let queue = DispatchQueue(label: "com.dewa.networkTask", qos: .utility)

    func cancel() {
        queue.sync {
            cancelled = true

            if let task = task {
                task.cancel()
            }
        }
    }
    
    func set(_ task: URLSessionTask) {
        queue.sync {
            self.task = task

            if cancelled {
                task.cancel()
            }
        }
    }
}
