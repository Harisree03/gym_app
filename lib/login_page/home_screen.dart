import 'package:flutter/material.dart';
import 'package:my_first_app/login_page/diet.dart';
import 'package:my_first_app/login_page/payment.dart';
import 'package:my_first_app/login_page/slotbooking.dart';
import 'package:my_first_app/login_page/workout.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildHomeCard(
              context,
              title: 'Workout Plan',
              icon: Icons.fitness_center,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutPlan()),
                );
              },
            ),
            _buildHomeCard(
              context,
              title: 'Slot Booking',
              icon: Icons.calendar_today,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SlotBooking()),
                );
              },
            ),
            _buildHomeCard(
              context,
              title: 'Diet Plan',
              icon: Icons.restaurant,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietPlan()),
                );
              },
            ),
            _buildHomeCard(
              context,
              title: 'Payment',
              icon: Icons.payment,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Theme.of(context).primaryColor),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
      ),
      body: Center(child: Text('This is the Workout Plan page')),
    );
  }
}

class SlotBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot Booking'),
      ),
      body: Center(child: Text('This is the Slot Booking page')),
    );
  }
}

class DietPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan'),
      ),
      body: Center(child: Text('This is the Diet Plan page')),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(child: Text('This is the Payment page')),
    );
  }
}
