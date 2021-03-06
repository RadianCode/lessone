//
//  ViewController.swift
//  lesson1 UI
//
//  Created by Дмитрий Виноградов on 04.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObserver()
        
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
        
    }
    
    private func addObserver() {
        // подписка на уведомления
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(handleKeyboard),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
        
    }
    
    private func removeObserver() {
        // отписка от уведомлений
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default
            .removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func handleKeyboard () {
        self.scrollView.contentInset.bottom += 120
        
    }
    
    @objc func keyboardWillHide() {
        self.scrollView.contentInset.bottom = 0
        
    }
    
    @IBAction private func onButtonPressed(_ sender: Any) {
        
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "admin" && password == "123" {
            print("Заходи!")
            self.showAdminScene()
            
            
        } else {
            print("Уходи")
            self.showAlert()
        }
        
    }
    
    private func showAdminScene() {
        
        let storyBoard = UIStoryboard(name: "tabbar", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? TabBarViewController {
            self.present(viewController, animated: true)
        }
        
    }
    
    private func showAlert () {
        let allertController = UIAlertController(title: "Ошбика",
                                                 message: "Введены неверные данные",
                                                 preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        
        allertController.addAction(action)
        self.present(allertController, animated: true)
    }
}










