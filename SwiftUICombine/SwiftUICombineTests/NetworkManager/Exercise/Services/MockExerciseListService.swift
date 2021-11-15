//
//  MockExerciseListService.swift
//  SwiftUICombineTests
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Combine
@testable import SwiftUICombine

class MockExcersieListService: ExcerciseListServiceProtocol {
    
    var getExcersieInfoShouldReturnError = false
    var getExcersieInfoShouldReturnData = false
    
    var getExcersieInfoCalled = false
    var getExcersieInfoCalledCount = 0
    
    func getExcersieInfo(for id: Int) -> Future<Exercise, Error> {
        self.getExcersieInfoCalled = true
        self.getExcersieInfoCalledCount = self.getExcersieInfoCalledCount + 1
        
        return Future { [weak self] promise in
            guard let self = self else {
                return promise(.failure(NetworkError.unknown))
            }
            if self.getExcersieInfoShouldReturnError {
                return promise(.failure(NetworkError.responseError))
            }
            if self.getExcersieInfoShouldReturnData {
                let itemObject = try! JSONDecoder().decode(Exercise.self, from: self.exceriseInfoData)
                return promise(.success(itemObject))
            }
            return promise(.failure(NetworkError.unknown))
        }
    }
    
    
    var getExcersieListShouldReturnError = false
    var getExcersieListShouldReturnData = false
    
    var getExcersieListCalled = false
    var getExcersieListCalledCount = 0
    
    func getExcersieList() -> Future<ExerciseInfo, Error> {
        self.getExcersieListCalled = true
        self.getExcersieListCalledCount = self.getExcersieListCalledCount + 1
        
        return Future { [weak self] promise in
            guard let self = self else {
                return promise(.failure(NetworkError.unknown))
            }
            if self.getExcersieListShouldReturnError {
                return promise(.failure(NetworkError.responseError))
            }
            if self.getExcersieListShouldReturnData {
                let itemObject = try! JSONDecoder().decode(ExerciseInfo.self, from: self.exerciseListData)
                return promise(.success(itemObject))
            }
            return promise(.failure(NetworkError.unknown))
        }
    }
    
    private let exerciseListData = """
        {
            "count": 419,
            "next": "https://wger.de/api/v2/exerciseinfo/?limit=10&offset=10",
            "previous": null,
            "results": [
                {
                    "id": 5,
                    "name": "Ausfallschritte im Gehen",
                    "uuid": "5675ae61-6597-4806-ae5c-2dda5a5ac03c",
                    "description": "<p>.</p>",
                    "creation_date": "2013-05-05",
                    "category": {
                        "id": 9,
                        "name": "Legs"
                    },
                    "muscles": [
                        {
                            "id": 10,
                            "name": "Quadriceps femoris",
                            "is_front": true,
                            "image_url_main": "/static/images/muscles/main/muscle-10.svg",
                            "image_url_secondary": "/static/images/muscles/secondary/muscle-10.svg"
                        }
                    ],
                    "muscles_secondary": [
                        {
                            "id": 8,
                            "name": "Gluteus maximus",
                            "is_front": false,
                            "image_url_main": "/static/images/muscles/main/muscle-8.svg",
                            "image_url_secondary": "/static/images/muscles/secondary/muscle-8.svg"
                        }
                    ],
                    "equipment": [
                        {
                            "id": 3,
                            "name": "Dumbbell"
                        }
                    ],
                    "language": {
                        "id": 1,
                        "short_name": "de",
                        "full_name": "Deutsch"
                    },
                    "license": {
                        "id": 1,
                        "full_name": " Creative Commons Attribution Share Alike 3",
                        "short_name": "CC-BY-SA 3",
                        "url": "https://creativecommons.org/licenses/by-sa/3.0/deed.en"
                    },
                    "license_author": "wger.de",
                    "images": [
                        {
                            "id": 121,
                            "uuid": "b0e8b77a-97c2-470f-9fc0-928ffb2aae89",
                            "exercise_base": 206,
                            "image": "https://wger.de/media/exercise-images/113/Walking-lunges-1.png",
                            "is_main": true,
                            "status": "2",
                            "style": "1"
                        },
                        {
                            "id": 122,
                            "uuid": "52c4434e-b5a2-4fce-af61-d997b510438a",
                            "exercise_base": 206,
                            "image": "https://wger.de/media/exercise-images/113/Walking-lunges-2.png",
                            "is_main": false,
                            "status": "2",
                            "style": "1"
                        },
                        {
                            "id": 123,
                            "uuid": "3d311933-e073-409b-92d3-41f3d75e8c94",
                            "exercise_base": 206,
                            "image": "https://wger.de/media/exercise-images/113/Walking-lunges-3.png",
                            "is_main": false,
                            "status": "2",
                            "style": "1"
                        },
                        {
                            "id": 124,
                            "uuid": "c0dff0d5-618d-4739-94f9-7d3cd76bc8a1",
                            "exercise_base": 206,
                            "image": "https://wger.de/media/exercise-images/113/Walking-lunges-4.png",
                            "is_main": false,
                            "status": "2",
                            "style": "1"
                        }
                    ],
                    "comments": [],
                    "variations": [
                        55,
                        5
                    ]
                }
            ]
        }
    """.data(using: .utf8)!
    
    private let exceriseInfoData = """
        {
            "id": 5,
            "name": "Ausfallschritte im Gehen",
            "uuid": "5675ae61-6597-4806-ae5c-2dda5a5ac03c",
            "description": "<p>.</p>",
            "creation_date": "2013-05-05",
            "category": {
                "id": 9,
                "name": "Legs"
            },
            "muscles": [
                {
                    "id": 10,
                    "name": "Quadriceps femoris",
                    "is_front": true,
                    "image_url_main": "/static/images/muscles/main/muscle-10.svg",
                    "image_url_secondary": "/static/images/muscles/secondary/muscle-10.svg"
                }
            ],
            "muscles_secondary": [
                {
                    "id": 8,
                    "name": "Gluteus maximus",
                    "is_front": false,
                    "image_url_main": "/static/images/muscles/main/muscle-8.svg",
                    "image_url_secondary": "/static/images/muscles/secondary/muscle-8.svg"
                }
            ],
            "equipment": [
                {
                    "id": 3,
                    "name": "Dumbbell"
                }
            ],
            "language": {
                "id": 1,
                "short_name": "de",
                "full_name": "Deutsch"
            },
            "license": {
                "id": 1,
                "full_name": " Creative Commons Attribution Share Alike 3",
                "short_name": "CC-BY-SA 3",
                "url": "https://creativecommons.org/licenses/by-sa/3.0/deed.en"
            },
            "license_author": "wger.de",
            "images": [
                {
                    "id": 121,
                    "uuid": "b0e8b77a-97c2-470f-9fc0-928ffb2aae89",
                    "exercise_base": 206,
                    "image": "https://wger.de/media/exercise-images/113/Walking-lunges-1.png",
                    "is_main": true,
                    "status": "2",
                    "style": "1"
                },
                {
                    "id": 122,
                    "uuid": "52c4434e-b5a2-4fce-af61-d997b510438a",
                    "exercise_base": 206,
                    "image": "https://wger.de/media/exercise-images/113/Walking-lunges-2.png",
                    "is_main": false,
                    "status": "2",
                    "style": "1"
                },
                {
                    "id": 123,
                    "uuid": "3d311933-e073-409b-92d3-41f3d75e8c94",
                    "exercise_base": 206,
                    "image": "https://wger.de/media/exercise-images/113/Walking-lunges-3.png",
                    "is_main": false,
                    "status": "2",
                    "style": "1"
                },
                {
                    "id": 124,
                    "uuid": "c0dff0d5-618d-4739-94f9-7d3cd76bc8a1",
                    "exercise_base": 206,
                    "image": "https://wger.de/media/exercise-images/113/Walking-lunges-4.png",
                    "is_main": false,
                    "status": "2",
                    "style": "1"
                }
            ],
            "comments": [],
            "variations": [
                55,
                5
            ]
        }
    """.data(using: .utf8)!

}
