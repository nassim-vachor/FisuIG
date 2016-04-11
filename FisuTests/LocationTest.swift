//
//  LocationTest.swift
//  Fisu
//
//  Created by nassim on 11/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu
class LocationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    // test de la fonction qui insere des nouvelle locations
    func testLocInsert()
        {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        ///- l'insertion d'un nouveau day
        let loc = Location.insertNewLocation(moc, id: 100, name: "polytech", address: "UM", lat: 122.8, long: 123.9)
        XCTAssertNotNil(loc , "L'insertion de Day8 c'est bien passee")
        let loc1 = Location.insertNewLocation(moc, id: 100, name: "polytech", address:"UM", lat: 122.8, long: 123.9)
        
        ///- Si jamais on insere un day qui a deja ete insere, il n y pas d erreur ni de nouvelle insertion: le day qui avait ete insere est juste retourne
        XCTAssertEqual(loc, loc1, "loc et le loc1  ne correspondent pas au meme lieu")
        // nettoyage de la base apres les test
        Location.deleteData(100)
    }
    
    
    
    // test de la fonction qui renvoie tous les loc existants dans la base, on en a 28 
    func testGetDayFetchedResultController()
    {
        let   frc = Location.getLocationFetchedResultController("Location", key: "idLoc")
        do {
            try frc.performFetch()
        } catch {
            
            print("An error occured")
        }
        let sections = frc.sections
        let currentSection = sections![0]
        // On a 6 dans notre base
        XCTAssertEqual( currentSection.numberOfObjects, 28,   "le nombre de jour existant est faux")
        
    }
    
}
