//
//  DatabaseServise.swift
//  Shop
//
//  Created by Денис Александров on 26.10.2022.
//

import Foundation
import FirebaseFirestore


// наша база данных
class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() { }
    
    func getPositions(by orderID: String,completion: @escaping (Result<[Position], Error>) -> ()) {
        
        let positionsRef = ordersRef.document(orderID).collection("positions")
        
        
        positionsRef.getDocuments { qSnap, erroe in
            
            
            if let querySnapshot = qSnap {
                var positions = [Position]()
                
                for doc in querySnapshot.documents {
                    if let position = Position(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = erroe {
                completion(.failure(error))
            }
            
        }
        
    }
    func getOrders(by userID: String?,
                   completion: @escaping (Result<[Order], Error>) -> ()) {
        
        self.ordersRef.getDocuments { qSnap, error in
            if let qSnap = qSnap {
                var oreders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            oreders.append(order)
                        }

                    } else { // ветка админа
                        if let order = Order(doc: doc) {
                            oreders.append(order)
                        }
                    }
                }
                
                completion(.success(oreders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }

    func setOrder(order: Order,
                  completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else  {
                
                
                self.setPositions(to: order.id,
                             position: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                        
                    }
                    
                }
                 completion(.success(order))
            }
        }
    }
               
    
    func setPositions(to orderId: String,
                     position: [Position],
                     completion: @escaping (Result<[Position], Error>) -> ()) {
        
        
        let positionsRef = ordersRef.document(orderId).collection("positions")
        
        for position in position {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(position))
    }
    
    func setProfile(user: MWUser, completion: @escaping (Result<MWUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }

        func getProfile(completion: @escaping (Result<MWUser, Error>) -> ()) {
            
            usersRef.document(AuthService.shared.currentUser!.uid).getDocument { documentSnapshot, error in
                
                guard let snap = documentSnapshot else { return }
                guard let data = snap.data() else { return }
                guard let userName = data["name"] as? String else {return }
                guard let id = data["id"] as? String else {return }
                guard let phone = data["phone"] as? Int else {return }
                guard let address = data["address"] as? String else {return }
                
                let user = MWUser(id: id, name: userName, phone: phone, address: address)
                
                completion(.success(user))
                
            }
            
        }
        
    }



















