import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF5F6FAFF),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Greeting and Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Greeting and Date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'May 25, 2006',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),

                  // 3-Line Menu Button
                  PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onSelected: (value) {
                      if (value == 'MyMood') {
                        Navigator.pushNamed(context, '/mymood');
                      } else if (value == 'Insights') {
                        Navigator.pushNamed(context, '/insights');
                      } else if (value == 'Settings') {
                        Navigator.pushNamed(context, '/settings');
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      _buildHoverableMenuItem('MyMood'),
                      _buildHoverableMenuItem('Insights'),
                      _buildHoverableMenuItem('Settings'),
                    ],
                    icon: Icon(Icons.menu, size: 30),
                  ),
                ],
              ),
            ),

            // Rest of the UI
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mood Card
                    _buildMoodCard(),

                    SizedBox(height: 32),

                    // Mood Over Time heading
                    Text(
                      'Mood Over Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    // Placeholder for graph
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Insert Graph/Image Here',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    SizedBox(height: 32),

                    // Streaks
                    Text(
                      'Streaks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildStreakCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable menu item with hover highlight
  PopupMenuItem<String> _buildHoverableMenuItem(String label) {
    return PopupMenuItem<String>(
      value: label,
      child: MouseRegion(
        onEnter: (event) {},
        onExit: (event) {},
        child: StatefulBuilder(
          builder: (context, setState) {
            bool isHovered = false;
            return MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.grey.shade300 : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(label),
              ),
            );
          },
        ),
      ),
    );
  }

  // Mood Card Widget
  Widget _buildMoodCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Great',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '9:00 pm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text('🙂', style: TextStyle(fontSize: 40)),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Insights',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Streak Card Widget
  Widget _buildStreakCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '10 Days',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Keep It going!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 20),
        ],
      ),
    );
  }
}