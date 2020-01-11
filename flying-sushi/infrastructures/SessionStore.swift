import SwiftUI
import Firebase
import Combine

class SessionStore : ObservableObject {
    @Published  var didChange = PassthroughSubject<SessionStore, Never>()
    @Published  var session: User? { didSet { self.didChange.send(self) }}
    @Published   var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(String(describing: user.displayName))")
                self.session = User(
                    uid: user.uid,
                    displayName: user.displayName,
                    email: user.email
                )
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }
    
    func signUp(
        email: String,
        displayName: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().createUser(withEmail: email, password: password){(result, error) in
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["email": email, "displayName":displayName, "password":password ]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: {
                (error, ref) in
                if error != nil{
                    print(error!)
                    return
                }
                print("Succesfully signed in")
            })
        }
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    // additional methods (sign up, sign in) will go here
}
