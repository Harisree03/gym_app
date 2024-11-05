import 'package:flutter/material.dart';

class DietPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMealCard(
              title: 'Breakfast',
              description:
                  'This breakfast diet plan focuses on nutritious options to kickstart your day. It includes foods like oatmeal with fruits, Greek yogurt with honey and nuts, scrambled eggs with vegetables, and smoothies packed with greens and protein. Aim for balanced meals to provide energy and keep you full until lunch.',
              imagePath: 'assets/images/breakfast.jpg',
            ),
            _buildMealCard(
              title: 'Lunch',
              description:
                  'This lunch diet plan focuses on balanced nutrition, featuring lean proteins (like chicken or tofu), whole grains (such as quinoa or brown rice), and plenty of vegetables. Aim for healthy fats from sources like avocado or nuts, and keep portions moderate to support weight management and overall health.',
              imagePath: 'assets/images/lunch.jpg',
            ),
            _buildMealCard(
              title: 'Snacks',
              description:
                  'This snacks diet plan includes healthy options like fruits, nuts, yogurt, and whole-grain crackers to provide energy and nutrients between meals. Focus on portion control and choose snacks rich in fiber and protein to keep you satisfied and support your fitness goals.',
              imagePath: 'assets/images/snacks.jpeg',
            ),
            _buildMealCard(
              title: 'Dinner',
              description:
                  'This dinner diet plan focuses on balanced nutrition, including lean proteins, whole grains, and plenty of vegetables. Options may include grilled chicken with quinoa and steamed broccoli, or baked salmon with brown rice and asparagus. Aim for portion control and avoid heavy, high-calorie foods for optimal digestion and health.',
              imagePath: 'assets/images/dinner.jpeg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
