//
//  FCollectionReference.swift
//  CellProject
//
//  Created by Anthony on 7/30/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//
import Foundation
import FirebaseFirestore


enum FCollectionReference: String {
    case User
    case Typing
    case Recent
    case Message
    case Group
    case Call
}


func reference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
