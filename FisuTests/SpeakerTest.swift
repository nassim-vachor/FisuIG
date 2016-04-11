//
//  SpeakerTest.swift
//  Fisu
//
//  Created by nassim on 11/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu
class SpeakerTest: XCTestCase {
    
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
    // test de la fonction qui insere des nouveau speaker
    func testLocInsert()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        ///- l'insertion d'un nouveau day
        let speak = Speaker.insertNewSpeaker(moc, id: 100, nom: "vachor", prenom: "nassim", biograp: "the best swifter in the world", tel: "0658590481", photo: "Sala")
        let speak1 = Speaker.insertNewSpeaker(moc, id: 100, nom: "vachor", prenom: "nassim", biograp: "the best swifter in the world", tel: "0658590481", photo: "Sala")
        ///- Si jamais on insere un speaker qui a deja ete insere, il n y pas d erreur ni de nouvelle insertion: le day qui avait ete insere est juste retourne
        XCTAssertEqual(speak, speak1, "speak et speak1  ne correspondent pas au meme speaker")
        // nettoyage de la base apres les test
        Speaker.deleteData(100)
    }
    
}
