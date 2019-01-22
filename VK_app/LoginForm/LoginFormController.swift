//
//  LoginFormController.swift
//  VK_app
//
//  Created by Nikolay.Trofimov on 25/12/2018.
//  Copyright © 2018 Nikolay.Trofimov. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

  // MARK: - IBOutlet
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var loginField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  
  // когда клавиатура появляется
  @objc func keyboardWasShown(notification: Notification) {
    
    // получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    
    // добавляем отступ внизу UIScrollView, равный размеру клавиатуры
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
    print("когда клавиатура появляется")
  }
  
  // когда клавиатура исчезает
  @objc func keyboardWillBeHidden(notification: Notification) {
    
    // устанавливаем отступ внизу UIScrollView равный 0
    let contentInsets = UIEdgeInsets.zero
    scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
    print("когда клавиатура исчезает")
  }
  
  // подписка на сообщения из центра уведомлений, которые рассылает клавиатура
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // подписываемся на два уведомления: одно приходит при появлении клавиатуры
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    // второе - когда она пропадает
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    print("подписка на сообщения из центра уведомлений")
  }
  
  // метод отписки от уведомлений при исчезновении контроллера с экрана
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    print("метод отписки от уведомлений при исчезновении контроллера с экрана")
  }
  
  
  // исчезновение клавиатуры при клике по пустому месту
  @objc func hideKeyboard() {
    self.scrollView?.endEditing(true)
    print("исчезновение клавиатуры при клике по пустому месту")
  }

  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // жест нажатия
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    
    // присваиваем его UIScrollView
    scrollView?.addGestureRecognizer(hideKeyboardGesture)
    print("View Did Load")
  }
  


  // MARK: - IBAction
  @IBAction func buttonPressed(_ sender: Any) {
    print("Нажата кнопка войти")
  }
  
  // MARK: - Perform Segue on login
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
  
    // проверяем данные данные
    //let checkResult = checkUserData() // TODO: Enable Login
    let checkResult = true // TODO: Remove hardcode
    
    // если данные неверны - покажем ошибку
    if !checkResult {
      showLoginError()
    }
    
    // вернем результат проверки пользователя
    return checkResult
  }
  
  // MARK: - User data hardcode
  func checkUserData() -> Bool {
    let login = loginField.text!
    let password = passwordField.text!
    
    // проверка корректности логина и пароля
    if login == "admin" && password == "123456" {
      print("Успешная авторизация")
      return true
    } else {
      print("Неуспешная авторизация")
      return false
    }
  }
  
  // MARK: - Login Error Alert
  func showLoginError() {
    // создаем контроллер
    let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
    // создаем кнопку для UIAlertController
    let action = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
    // добавляем кнопку на UIAlertController
    alter.addAction(action)
    // показываем UIAlertController
    present(alter, animated: true, completion: nil)
  }
  
}
