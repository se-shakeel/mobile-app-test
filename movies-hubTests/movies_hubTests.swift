//
//  movies_hubTests.swift
//  movies-hubTests
//
//  Created by Shakeel on 1/20/23.
//

import XCTest
@testable import movies_hub

final class movies_hubTests: XCTestCase {
    
    let viewModelMoviesList = MoviesListViewModel()
    let viewModelMovieDetails = MovieDetailsViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMoviesListApi() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        
        let expectation = self.expectation(description: "get movies")
        var movies: [Movie]?
        var error: NSError?
        
        viewModelMoviesList.getMovies(in: UIViewController(), success: { (returnedMovies) in
            movies = returnedMovies
            expectation.fulfill()
        }) { (returnedError) in
            error = returnedError
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (timeoutError) in
            XCTAssertNil(timeoutError)
            XCTAssertNotNil(movies)
            XCTAssertNil(error)
        }
    }
    
    func testGetMovieDetailsWithValidId() {
        let expectation = self.expectation(description: "get movie details with valid id")
        var movie: Movie?
        var error: NSError?
        let validMovieId = 315162

        viewModelMovieDetails.getMovieDetails(movieId: validMovieId, success: { (returnedMovie) in
            movie = returnedMovie
            expectation.fulfill()
        }) { (returnedError) in
            error = returnedError
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5) { (timeoutError) in
            XCTAssertNil(timeoutError)
            XCTAssertNotNil(movie)
            XCTAssertNil(error)
            XCTAssertEqual(movie?.id, validMovieId)
        }
    }

    func testGetMovieDetailsWithInvalidId() {
        let expectation = self.expectation(description: "get movie details with invalid id")
        var movie: Movie?
        var error: NSError?
        let invalidMovieId = -1

        viewModelMovieDetails.getMovieDetails(movieId: invalidMovieId, success: { (returnedMovie) in
            movie = returnedMovie
            expectation.fulfill()
        }) { (returnedError) in
            error = returnedError
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5) { (timeoutError) in
            XCTAssertNil(timeoutError)
            XCTAssertNil(movie)
            XCTAssertNotNil(error)
        }
    }


    func testPerformanceExample() throws {
        self.measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            startMeasuring()
            for _ in 0..<10 {
                viewModelMoviesList.getMovies(in: UIViewController(), success: { (returnedMovies) in
                    // do nothing
                }) { (returnedError) in
                    // do nothing
                }
            }
            stopMeasuring()
        }
    }

}
