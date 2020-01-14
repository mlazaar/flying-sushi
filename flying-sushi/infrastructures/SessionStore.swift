import SwiftUI
import Firebase
import Combine

class SessionStore : ObservableObject {
    @Published  var didChange = PassthroughSubject<SessionStore, Never>()
    @Published  var session: User? { didSet { self.didChange.send(self) }}
    @Published   var handle: AuthStateDidChangeListenerHandle?
    
    private var ref: DatabaseReference = Database.database().reference()
    
    func listen () {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                self.ref.child("users").child(user.uid).observeSingleEvent(of  : .value) {
                    (snapshot) in
                    let dictionnary = snapshot.value as? [String: AnyObject]
                    self.session = User(
                        uid: user.uid,
                        displayName: dictionnary!["displayName"] as! String?,
                        email: user.email
                    )
                }
                
            } else {
                self.session = nil
            }
        }
    }
    
    func loadUserData()-> [String: AnyObject]?{
        guard let uid = Auth.auth().currentUser?.uid else {return nil}
        var dictionnary:[String: AnyObject]?
        self.ref.child("users").child(uid).observeSingleEvent(of  : .value) {
            (snapshot) in
            dictionnary = snapshot.value as? [String: AnyObject]
        }
        return dictionnary
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
            self.ref.child("users").child(uid).updateChildValues(values, withCompletionBlock: {
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
    
}
