//
//  NetworkEngineTests.swift
//  ClassifiedsTests
//
//  Created by Sateesh on 16/01/2021.
//

import XCTest
@testable import Classifieds

class NetworkEngineTests: XCTestCase {
    
    var classifiedJson:[String:Any]?
    var url:String?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        url = AppUrl.classifiedsList

        classifiedJson = [
            "results" : [
                [
                    "created_at" : "2019-02-24 04:04:17.566515",
                    "price" : "AED 5",
                    "name" : "Notebook",
                    "uid" : "4878bf592579410fba52941d00b62f94",
                    "image_ids" : [
                        "9355183956e3445e89735d877b798689"
                    ],
                    "image_urls" : [
                        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4ZMD6TIW2&Signature=jdI9dwehOzEadpfXUJcW9NfN1J8%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEFgaCXVzLWVhc3QtMSJIMEYCIQD9J5ouh5G10QL2KrSlr53LsQwCpIhb%2BNGdLPkrrgVE4wIhALHMWab1J8rvgQV2mySomYMphA8Rk6gGvniyWGkx0SfJKs4BCDEQAhoMMTg0Mzk4OTY2ODQxIgwviQHy6kE4VIdV%2B0AqqwFUxO8X39QEi4Fh%2FQYUR4RVXpMGXbsyAr6cPhzbrIDWwySyuDxjgjfs8lo4JOYQovuNnJh8SUDUhBJO%2FSlpIlFrWyHj9i%2BF8Xz2lxA0sxzP83ADY3tWHCi1BKX%2FqQq%2FBb3KVdJcB1euEnNOUWQWMt6mVHS5bXxxuTpz%2FzMrRu1%2Bq%2FDW4SPM%2BU80rU1ptcVAUV8MulIWfaU1pwv7If4hVopEcjuLS9VJTdv6p%2Bwwpo2MgAY63wH3MVE4O3eWps4QaKZonjlxdPzFwnfWjsqOqjOxJT8vbjFKuxU%2BqXA1DdN6PaZj2s1EJ8JQf6r0UKqf3ItQUdBXeBg%2F74Jv5dYJq3VmeO9kJw8KtNfSzLkcX%2FPSWntAl8YaGMgHFbcOdXaT4uCcbq9E%2Bw0xMVPYxW8%2Fzc5pO67z0%2FQ6H%2Bj6ZGka%2F17tpMtIbcxJrmwEEw5sKKt%2FczVC1Hao7aRm46U5HXlGoglFhPoFgQOzOZ7ninmm67MoTrhjy6vV%2Fw%2FLbGxCcaohIgzEMeL0bVwc98C5avyGDkc4eB9l&Expires=1610814649"
                    ],
                    "image_urls_thumbnails" : [
                        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4ZMD6TIW2&Signature=YpzGuG%2FJRatz4oUHU57qYXGLgEA%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEFgaCXVzLWVhc3QtMSJIMEYCIQD9J5ouh5G10QL2KrSlr53LsQwCpIhb%2BNGdLPkrrgVE4wIhALHMWab1J8rvgQV2mySomYMphA8Rk6gGvniyWGkx0SfJKs4BCDEQAhoMMTg0Mzk4OTY2ODQxIgwviQHy6kE4VIdV%2B0AqqwFUxO8X39QEi4Fh%2FQYUR4RVXpMGXbsyAr6cPhzbrIDWwySyuDxjgjfs8lo4JOYQovuNnJh8SUDUhBJO%2FSlpIlFrWyHj9i%2BF8Xz2lxA0sxzP83ADY3tWHCi1BKX%2FqQq%2FBb3KVdJcB1euEnNOUWQWMt6mVHS5bXxxuTpz%2FzMrRu1%2Bq%2FDW4SPM%2BU80rU1ptcVAUV8MulIWfaU1pwv7If4hVopEcjuLS9VJTdv6p%2Bwwpo2MgAY63wH3MVE4O3eWps4QaKZonjlxdPzFwnfWjsqOqjOxJT8vbjFKuxU%2BqXA1DdN6PaZj2s1EJ8JQf6r0UKqf3ItQUdBXeBg%2F74Jv5dYJq3VmeO9kJw8KtNfSzLkcX%2FPSWntAl8YaGMgHFbcOdXaT4uCcbq9E%2Bw0xMVPYxW8%2Fzc5pO67z0%2FQ6H%2Bj6ZGka%2F17tpMtIbcxJrmwEEw5sKKt%2FczVC1Hao7aRm46U5HXlGoglFhPoFgQOzOZ7ninmm67MoTrhjy6vV%2Fw%2FLbGxCcaohIgzEMeL0bVwc98C5avyGDkc4eB9l&Expires=1610814649"
                    ]
                    
                    
                    
                ]
            ]
        ]
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        classifiedJson = nil
        url = nil
    }
    
    func testSuccessfulResponse() {
        
        //Given
        // Setup our objects
        let session = URLSessionMock()
        let manager = Network(session: session)
        
        //When
        // Create data and tell the session to always return it
        let data = jsonToNSData(json: classifiedJson!)
        session.data = data
        
        
        let promise = expectation(description: "Expected data conversion error")
        
        // Create a URL (using the file path API to avoid optionals)
        let url = AppUrl.classifiedsList
        
        let request = Request(path: url)
        manager.send(request) { (result: Result<ClassifiedsListModel, Error>) in
            
            //Then
            switch result {
            case .success(let response):
                promise.fulfill()
            case .failure(let error):
                XCTAssert(false)
            }
        }
        
        wait(for: [promise], timeout: 3)

    }
    
    func test_FiailResponse() {
        // Setup our objects
        let session = URLSessionMock()
        let manager = Network(session: session)
        
        let promise = expectation(description: "Expected data conversion error")

        // Create data and tell the session to always return it
        let data = jsonToNSData(json: classifiedJson!)
        session.data = nil
        // Create a URL (using the file path API to avoid optionals)
        let url = AppUrl.classifiedsList
        var testResult:Result<ClassifiedsListModel, Error>?
        let request = Request(path: url)
        manager.send(request) { (result: Result<ClassifiedsListModel, Error>) in
            testResult = result
            switch result {
            case .success(let response):
                XCTFail("Expected data conversion error")
            case .failure(let error):
                promise.fulfill()

            }
        }
        wait(for: [promise], timeout: 3)
        
    }
    
    func jsonToNSData(json: Any) -> Data?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
}

