import 'package:flutter/material.dart';
import 'package:pad_fundation/mitra_page/login_page_mitra.dart';
import 'package:pad_fundation/theme.dart';

class ChooseRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FUNDation',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),

              SizedBox(height: 30),

              Text(
                'Pilih Peran Anda',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(229, 38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the radius here
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPageMitra()),
                  );
                },
                child: Text(
                  'M I T R A',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Dukung Event sebagai Mitra Sponsor',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[900],
                  minimumSize: Size(229, 38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the radius here
                  ),
                ),
                onPressed: () {
                  // Add your action here
                },
                child: Text(
                  'O R G A N I Z E R',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Rencanakan Event Anda sebagai Organizer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
