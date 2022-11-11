import 'package:fitness_ui/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen>
    with TickerProviderStateMixin {
  late AnimationController _textOpacityController;
  late Animation<double> _textOpacityAnimation;
  void _initTextOpacity() {
    _textOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _textOpacityAnimation =
        Tween<double>(begin: .2, end: 1).animate(_textOpacityController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _textOpacityController.reverse();
            }
            if (status == AnimationStatus.dismissed) {
              _textOpacityController.forward();
            }
          });
  }

  late AnimationController _screenScaleController;
  late Animation<double> _screenScaleAnimation;
  void _initScreenScale() {
    _screenScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _screenScaleAnimation =
        Tween<double>(begin: 1, end: 70).animate(_screenScaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                // Scale animation completed
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const DashboardScreen(),
                        type: PageTransitionType.fade));
              }
            },
          );
  }

  @override
  void initState() {
    _initTextOpacity();
    _textOpacityController.forward();
    _initScreenScale();
    super.initState();
  }

  @override
  void dispose() {
    _textOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Exercise 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                '15',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Minutes',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '3',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Times',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _textOpacityController,
                builder: (_, child) => Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: const Text(
                    'Start the morning with your health',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 35),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton.filled(
                  child: AnimatedBuilder(
                    animation: _screenScaleController,
                    builder: (_, child) => Transform.scale(
                      scale: _screenScaleAnimation.value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (!_screenScaleController.isDismissed)
                            Container(
                              height: 25,
                              decoration: const BoxDecoration(
                                  color: CupertinoColors.activeBlue,
                                  shape: BoxShape.circle),
                            ),
                          Text(
                            _screenScaleController.isDismissed ? 'Start' : '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () {
                    _screenScaleController.forward();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
