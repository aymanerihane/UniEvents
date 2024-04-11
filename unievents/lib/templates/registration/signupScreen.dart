import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unievents/themes/themes.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isPasswordMatch= false;
  bool isEmailValid= false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) => Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, Color(0xFFCFD8DC)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (value) {
                          // Vérifier la validité de l'e-mail ici
                          isEmailValid = controller.isEmailValid(value);
                          // Mettre à jour l'affichage
                          controller.update();
                        },
                        decoration: InputDecoration(
                          labelText: 'Gmail',
                          suffixIcon: Icon(
                                isEmailValid ? Icons.check_circle : Icons.error_outline, 
                                // Utiliser l'icône de vérification ou l'icône d'erreur en fonction de la validité de l'adresse Gmail
                                color: isEmailValid ? Colors.green : Colors.grey, 
                                // Utiliser la couleur verte si l'adresse Gmail est valide, sinon gris
                              ),
                              errorText: isEmailValid ? null : 'Veuillez utiliser un e-mail institutionnel', 
                              // Afficher un message d'erreur si l'adresse Gmail n'est pas valide
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
   
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Inverser l'état pour montrer ou masquer le mot de passe
                              isPasswordVisible = !isPasswordVisible;
                              // Mettre à jour l'affichage
                              controller.update();
                            },
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !isConfirmPasswordVisible, // Toujours masquer le mot de passe de confirmation
                        onChanged: (value) {
                          // Vérifier si le mot de passe correspond au mot de passe de confirmation
                          isPasswordMatch = controller.isPasswordMatch(passwordController.text, value);
                          // Mettre à jour l'affichage
                          controller.update();
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: isPasswordMatch != null ? (isPasswordMatch ? Colors.green : Colors.red) : Colors.red), // Couleur différente en fonction de la correspondance des mots de passe
                          ),
                              suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Inverser l'état pour montrer ou masquer le mot de passe
                              isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              // Mettre à jour l'affichage
                              controller.update();
                            },
                          ),
                          errorText: passwordController.text.isNotEmpty && !isPasswordMatch ? 'Passwords do not match' : null, // Afficher un message d'erreur si les mots de passe ne correspondent pas et que le champ du mot de passe n'est pas vide
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 70),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [primaryColor, Color(0xFFCFD8DC)],
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Appeler la fonction de validation des champs du formulaire
                              Get.find<SignupController>().validateFields(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Appel de la fonction pour valider les champs
                                controller.validateFields(
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text,
                                );
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}

class SignupController extends GetxController {
  bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool isEmailValid(String email) {
    // Vérifier la validité de l'e-mail
    return email.isNotEmpty && (email.endsWith('@etu.uae.ac.ma') || email.endsWith('@uae.ac.ma'));
  }

  void validateFields(String firstName, String lastName, String email, String password, String confirmPassword) {
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Email: $email');
    print('Password: $password');
    print('Confirm Password: $confirmPassword');
    
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
    } else if (!isEmailValid(email)) {
      Get.snackbar("Error", "Please enter a valid email address");
    } else if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters long");
    } else if (!isPasswordMatch(password, confirmPassword)) {
      Get.snackbar("Error", "Passwords do not match");
    } else {
      // Continue with further processing, for example, user registration
    }
  }
}