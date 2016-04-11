//
//  AccomodationTest.swift
//  Fisu
//
//  Created by Djeneba KANE on 11/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import XCTest
@testable import Fisu

class AccomodationTest: XCTestCase {
    
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
    
    func testInsertAccomodation()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let hotel1 = Accomodation.insertNewAccomodation(moc, id: 1000, nom: "Novotel", desc: "Contemporary hotel with a terrace coffee ,a bar , an outdoor pool and a playground ", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse:nil, tel: "04 99 52 34 34", photo: "novotel" )
        
        XCTAssertNotNil(hotel1, "L'insertion de hotel1 c'est mal bien passee")
        
        let hotel2 =  Accomodation.insertNewAccomodation(moc, id: 1000, nom: "Domino's Pizza", desc:"Pizza", dateD :"04/07/2016, 11:00", dateF:"01/07/2016, 23:30", adresse: nil , tel: "06 67 79 29 20", photo: "Domino's")
        
        
        // verification de l'egalite entre hotel1 et hotel2
        ///- Si jamais on insere un Accomodation  qui a deja ete insere, il n'y pas d erreur ni de nouvelle insertion: l' Accomodation qui avait ete insere est juste retourne
        XCTAssertEqual(hotel1, hotel2, "hotel1 et hotel2 ne correspondent pas au meme Accomodation")
        
        // nettoyage de la base apres les test
        Accomodation.deleteData(1000)
        
        
    }
    

    func testgetDay()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        let hotel1 = Accomodation.insertNewAccomodation(moc, id: 1000, nom: "Novotel", desc: "Contemporary hotel with a terrace coffee ,a bar , an outdoor pool and a playground ", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse: nil, tel: "04 99 52 34 34", photo: "novotel" )
        
        ///- permet de recuperer le day correspondant a hotel1
        
        XCTAssertEqual(hotel1!.getDay(),"Friday, July 1, 2016")
        
        // nettoyage de la base apres les test
        Accomodation.deleteData(1000)
        
        
    }
    
    // test de la fonction convertStringToNSDate : permettant de trasformer un string en NSDate
    func testconvertStringToNSDate()
    {
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        // initialisation d une Accomodation
        let hotel1 = Accomodation.insertNewAccomodation(moc, id: 1000, nom: "Novotel", desc: "Contemporary hotel with a terrace coffee ,a bar , an outdoor pool and a playground ", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse:nil, tel: "04 99 52 34 34", photo: "novotel" )
        
        // hotel1!.ouverture est un NSDate
        XCTAssertEqual(hotel1!.ouverture ,Accomodation.convertStringToNSDate("01/07/2016, 05:00"), " ces deux NSDate ne sont pas egales")
        
        // nettoyage de la base apres les test
        Accomodation.deleteData(1000)
        
        
        
    }
    // fonction permettant de tester la foction  getTimeDeb et getTimeFin, qui retourne la date de debut d'une activite sous forme de String
    func testgetTimeDebFin()
    {
        
        let moc = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        
        // initialisation d une Accomodation ayant lieu le 8eme jour
        let hotel1 = Accomodation.insertNewAccomodation(moc, id: 1001, nom: "Novotel", desc: "Contemporary hotel with a terrace coffee ,a bar , an outdoor pool and a playground ", dateD: "01/07/2016, 05:00", dateF: "01/07/2016, 23:40", adresse:nil, tel: "04 99 52 34 34", photo: "novotel" )
        
        // verification de l egalite entre "05:00 AM" (correspondant a dateD de hotel1) et la date de debut de hotel1
        XCTAssertEqual(hotel1!.getTimeDeb(),"5:00 AM")
        
        /// verification de l egalite entre "23:30 PM" (correspondant a dateF de hotel1) et la date de fin de hotel1
        XCTAssertEqual(hotel1!.getTimeFin(),"11:40 PM")
        
        // nettoyage de la base apres les test
        Accomodation.deleteData(1001)
        
    }
    
    
}
