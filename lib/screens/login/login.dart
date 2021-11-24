import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/login/widgets/blue_top_clipper.dart';
import 'package:onboarding_concept/screens/login/widgets/grey_top_clipper.dart';
import 'package:onboarding_concept/screens/login/widgets/header.dart';
import 'package:onboarding_concept/screens/login/widgets/login_form.dart';
import 'package:onboarding_concept/screens/login/widgets/white_top_clipper.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({Key? key, required this.screenHeight}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _headerTextAnimation;
  Animation<double>? _formElementAnimation;
  Animation<double>? _whiteTopClipperAnimation;
  Animation<double>? _blueTopClipperAnimation;
  Animation<double>? _greyTopClipperAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    var fadeSlideTween = Tween<double>(
      begin: 0.0,
      end: 1.0,
    );
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController ??
          AnimationController(
            vsync: this,
            duration: kLoginAnimationDuration,
          ),
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController ??
          AnimationController(
            vsync: this,
            duration: kLoginAnimationDuration,
          ),
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    var clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );

    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController ??
            AnimationController(
              vsync: this,
              duration: kLoginAnimationDuration,
            ),
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController ??
            AnimationController(
              vsync: this,
              duration: kLoginAnimationDuration,
            ),
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController ??
            AnimationController(
              vsync: this,
              duration: kLoginAnimationDuration,
            ),
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            child: Container(
              color: kGrey,
            ),
            builder: (context, child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _whiteTopClipperAnimation!.value,
                ),
                child: child,
              );
            },
          ),
           AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            child: Container(
              color: kBlue,
            ),
            builder: (context, child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _greyTopClipperAnimation!.value,
                ),
                child: child,
              );
            },
          ),
           AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            child: Container(
              color: kWhite,
            ),
            builder: (context, child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _blueTopClipperAnimation!.value,
                ),
                child: child,
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: const <Widget>[
                  Header(
                    animation: _headerTextAnimation,
                  ),
                  Spacer(),
                  LoginForm(
                    animation: _formElementAnimation,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
