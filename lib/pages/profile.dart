import 'package:arti_find/main.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FirstScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('img/tao.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Juan Dela Cruz',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'example@email.com',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileEdit(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6F1D1B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4.0,
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Color(0xFFE9DBC7),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey, // Replace with your desired color
              thickness: 2, // Specify the thickness of the divider
            ),// Add a line below the button
          ],
        ),
      ),
    );
  }
}



class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('img/tao.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              buildFormField("First Name", "Juan", false),
              buildFormField("Last Name", "Dela Cruz", false),
              buildFormField("Email", "example@email.com", false),
              buildFormField("Phone", "0909837412314", false),
              buildFormField("Gender", "Male", false),
              buildFormField("Password", "*******", true),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profile()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: const Color(0xFF6F1D1B),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFormField(String labelText, String placeholder, bool isPasswordTextField) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
              )
            ],
          ),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.text,
            obscureText: isPasswordTextField ? isObscurePassword : false,
            style: const TextStyle(
              color: Colors.black54,
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.black38),
              suffixIcon: isPasswordTextField
                  ? IconButton(
                icon: Icon(
                  isObscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isObscurePassword = !isObscurePassword;
                  });
                },
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
