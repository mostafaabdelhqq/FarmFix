import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final BuildContext parentContext;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.parentContext,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final Color backgroundColor = const Color(0xFFF5E8DA);
  final Color selectedColor = const Color(0xFF6D4C41);
  final Color unselectedColor = const Color(0xFFA1887F);

  // 1. تعريف الشاشات كمتغيرات منفصلة أولاً
  final Widget homeScreen = const HomeScreen();
  final Widget searchScreen = const SearchScreen();
  final Widget profileScreen = const ProfileScreen();

  // 2. تحديد عناصر التنقل مع التأكد من أن كل عنصر يحتوي على شاشة
  late final List<Map<String, dynamic>> navItems = [
    {
      'icon': const FaIcon(FontAwesomeIcons.expand),
      'screen': homeScreen,
    },
    {
      'icon': const FaIcon(FontAwesomeIcons.comments),
      'screen': searchScreen,
    },
    {
      'icon': const FaIcon(FontAwesomeIcons.globe),
      'screen': profileScreen,
    },
  ];

  void _navigateToScreen(int index) {
    // 3. التحقق من وجود الشاشة قبل التنقل
    if (navItems[index]['screen'] != null) {
      Navigator.of(widget.parentContext).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              navItems[index]['screen'] as Widget, // 4. تأكيد النوع
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final isSelected = index == widget.currentIndex;
          return IconButton(
            onPressed: () => _navigateToScreen(index),
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Icon(
                    navItems[index]['icon'],
                    key: ValueKey<int>(index),
                    color: isSelected ? selectedColor : unselectedColor,
                    size: isSelected ? 28 : 24,
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  width: isSelected ? 20 : 0,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          );
        }),
      ),
    );
  }
}

// 5. تعريف الشاشات بشكل صحيح
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen Content')),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: const Center(child: Text('Search Screen Content')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Screen Content')),
    );
  }
}
