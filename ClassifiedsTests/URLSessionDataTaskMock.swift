//
//  URLSessionDataTaskMock.swift
//  ClassifiedsTests
//
//  Created by Sateesh on 16/01/2021.
//
import UIKit

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}
