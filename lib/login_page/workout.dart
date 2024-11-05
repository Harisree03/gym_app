import 'package:flutter/material.dart';

class WorkoutPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildWorkoutCard(
              title: 'Chest Workout',
              description:
                  'Perform 3 sets of 10 reps of Bench Press, focusing on lowering the barbell to your chest and pushing it back up. Follow with 3 sets of 10 reps for Incline Dumbbell Press, 3 sets of 12 reps of Push-Ups, 3 sets of 12 reps for Chest Flys, and finish with 3 sets of 12 reps of Cable Crossovers. Remember to warm up, rest between sets, and stay hydrated!',
              imagePath: 'gym_gifs/gifs/chest.gif',
            ),
            _buildWorkoutCard(
              title: 'Back Workout',
              description:
                  '3 sets of 10 reps for pull-ups to target upper back and lats, 3 sets of 12 reps for bent-over rows to strengthen the middle back, 3 sets of 15 reps for face pulls to improve rear deltoids and traps, and 3 sets of 12 reps for lat pulldowns for overall back width.',
              imagePath: 'gym_gifs/gifs/back.gif',
            ),
            _buildWorkoutCard(
              title: 'Leg Workout',
              description:
                  'This leg workout targets the quadriceps, hamstrings, glutes, and calves. It includes squats, lunges, leg presses, deadlifts, and calf raises, each performed for 3 sets of 10-12 reps. Focus on proper form and remember to warm up before and cool down after your workout.',
              imagePath: 'gym_gifs/gifs/biceps.gif',
            ),
            _buildWorkoutCard(
              title: 'Shoulder Workout',
              description:
                  'This shoulder workout targets the deltoids with exercises like shoulder presses, lateral raises, front raises, and upright rows, performed for 3 sets of 10-12 reps. Remember to maintain proper form and include a warm-up and cool-down for best results.',
              imagePath: 'gym_gifs/gifs/shoulder.gif',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard({
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
