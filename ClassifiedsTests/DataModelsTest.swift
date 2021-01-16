//
//  DataModelsTest.swift
//  ClassifiedsTests
//
//  Created by Sateesh on 16/01/2021.
//

import XCTest
@testable import Classifieds

class DataModelsTest: XCTestCase {

    var classifiedJson:[String:Any]?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

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
    
    func test_ClassifiedsListModel_ShouldPassIfSuccessfullyDecoded() {

        //When
        let data = jsonToNSData(json: classifiedJson!)

        
        XCTAssertNotNil(data)
        
        do {
            //Given
            let dataModel = try JSONDecoder().decode(ClassifiedsListModel.self, from: data!)
            
            //Then
            XCTAssert(true)
        } catch let error {
            XCTFail("Expected '.keyNotFound' but got \(error)")
        }
        
    }
    
    func test_ClassifiedsListModel_ShouldPassIfDataTransformOfImagesIsSuccess() {

        //When
        let data = jsonToNSData(json: classifiedJson!)

        XCTAssertNotNil(data)
        
        do {
            
            //Given
            let dataModel = try JSONDecoder().decode(ClassifiedsListModel.self, from: data!)

            //Then
            XCTAssertNotNil(dataModel)
            XCTAssertNotNil(dataModel.results)
            XCTAssertEqual(dataModel.results?.count, 1)
            XCTAssertEqual(dataModel.results?[0].images?.count, 1)
            XCTAssertEqual(dataModel.results?[0].images?[0].uid, "9355183956e3445e89735d877b798689")

            
        } catch let error {
            XCTFail("Expected '.keyNotFound' but got \(error)")
        }
        
    }
    
    func jsonToNSData(json: Any) -> Data?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as Data
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }

    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         classifiedJson = nil
    }
}
