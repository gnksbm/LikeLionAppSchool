//
//  ViewController.swift
//  GoogleLoginKit
//
//  Created by gnksbm on 2023/08/09.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    //    let firebaseAuth = Auth.auth()
    
    //    var googleCredential: AuthCredential?
    
    @IBOutlet weak var googleLoginBtn: GIDSignInButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.text = Auth.auth().currentUser?.email
    }
    
    
    // signIn - login, 서버에 계정등록
    // signOut - logout
    // delete - logout, 서버에서 계정 삭제
    
    @IBAction func signIn(_ sender: GIDSignInButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else { return }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                changeUserName()
            }
        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        print("버튼 눌렸음")
        do {
            try Auth.auth().signOut()
            changeUserName()
            print("do")
        } catch let signOutError as NSError {
            print("catch")
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func deleteUserInfo(_ sender: UIButton) {
        Auth.auth().currentUser?.delete()
        changeUserName()
    }
    
    func changeUserName() {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            self.userEmail.text = user?.email
            print(user)
        }
    }
}
