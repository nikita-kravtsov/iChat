//
//  FirestoreService.swift
//  iChat
//
//  Created by Никита on 9/7/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, userName: String?, avatarImage: UIImage?, description: String? , sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(userName: userName, description: description, sex: sex) else {
            completion(.failure(UsersError.notFilled))
            return
        }
        
        guard avatarImage != #imageLiteral(resourceName: "avatar") else {
            completion(.failure(UsersError.photoNotExist))
            return
        }
        
        var mUser = MUser(userName: userName!,
                          email: email,
                          avatarStringURL: "none",
                          description: description!,
                          sex: sex!,
                          id: id)
        
        StorageService.shared.upload(photo: avatarImage!) { (result) in
            switch result {
                
            case .success(let url):
                mUser.avatarStringURL = url.absoluteString
                self.usersRef.document(mUser.id).setData(mUser.representation) { (error) in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(mUser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        let docUserRef = usersRef.document(user.uid)
        
        docUserRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let mUser = MUser(document: document) else {
                    completion(.failure(UsersError.cannotUnwrapToMUser))
                    return
                }
                completion(.success(mUser))
            } else {
                completion(.failure(UsersError.cannotGetUserInfo))
            }
        }
    }
}
