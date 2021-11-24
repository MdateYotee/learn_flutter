import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/login/login.dart';
import 'package:onboarding_concept/screens/onboarding/pages/community/community_dark_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/community/community_light_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/community/community_text_column.dart';
import 'package:onboarding_concept/screens/onboarding/pages/education/education_dark_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/education/education_light_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/education/education_text_column.dart';
import 'package:onboarding_concept/screens/onboarding/pages/page.dart';
import 'package:onboarding_concept/screens/onboarding/pages/work/work_dark_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/work/work_light_card_content.dart';
import 'package:onboarding_concept/screens/onboarding/pages/work/work_text_column.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/header.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/next_page_button.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/ripple.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;
  const Onboarding({Key? key, required this.screenHeight}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  int _currentPage = 1;
  bool get isFirstPage => _currentPage == 1;

  AnimationController? _cardsAnimationController;
  AnimationController? _pageIndicatorAnimationController;
  AnimationController? _rippleAnimationController;

  Animation<Offset>? _slideAnimationLightCard;
  Animation<Offset>? _slideAnimationDarkCard;
  Animation<double>? _pageIndicatorAnimation;
  Animation<double>? _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: kCardAnimationDuration,
    );
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: kButtonAnimationDuration,
    );
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(
      CurvedAnimation(
        parent: _rippleAnimationController ??
            AnimationController(
              vsync: this,
              duration: kRippleAnimationDuration,
            ),
        curve: Curves.easeIn,
      ),
    );
    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController!.dispose();
    _pageIndicatorAnimationController!.dispose();
    _rippleAnimationController!.dispose();
    super.dispose();
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    var multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
            parent: _pageIndicatorAnimationController ??
                AnimationController(
                  vsync: this,
                  duration: kButtonAnimationDuration,
                ),
            curve: Curves.easeIn),
      );
      _pageIndicatorAnimationController!.reset();
    });
  }

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
            number: 1,
            lightCardChild: const CommunityLightCardContend(),
            darkCardChild: const CommunityDarkCardContent(),
            darkCardOffsetAnimation: _slideAnimationDarkCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            lightCardOffsetAnimation: _slideAnimationLightCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            textColumn: const CommunityTextColumn());
      case 2:
        return OnboardingPage(
            number: 2,
            lightCardChild: const EducationLightCardContent(),
            darkCardChild: const EducationDarkCardContent(),
            darkCardOffsetAnimation: _slideAnimationDarkCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            lightCardOffsetAnimation: _slideAnimationLightCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            textColumn: const EducationTextColumn());
      case 3:
        return OnboardingPage(
            number: 3,
            lightCardChild: const WorkLightCardContent(),
            darkCardChild: const WorkDarkCardContent(),
            darkCardOffsetAnimation: _slideAnimationDarkCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            lightCardOffsetAnimation: _slideAnimationLightCard ??
                Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0.0),
                ).animate(CurvedAnimation(
                  parent: _cardsAnimationController ??
                      AnimationController(
                        duration: kCardAnimationDuration,
                        vsync: this,
                      )
                    ..repeat(reverse: true),
                  curve: Curves.elasticIn,
                )),
            textColumn: const WorkTextColumn());
      default:
        throw Exception("Page with number  '$_currentPage' does not exist.");
    }
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _cardsAnimationController ??
              AnimationController(
                duration: kCardAnimationDuration,
                vsync: this,
              )
            ..repeat(reverse: true),
          curve: Curves.easeOut));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: const Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _cardsAnimationController ??
              AnimationController(
                duration: kCardAnimationDuration,
                vsync: this,
              )
            ..repeat(reverse: true),
          curve: Curves.easeOut));
      _cardsAnimationController!.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
          parent: _cardsAnimationController ??
              AnimationController(
                duration: kCardAnimationDuration,
                vsync: this,
              )
            ..repeat(reverse: true),
          curve: Curves.easeIn));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
          parent: _cardsAnimationController ??
              AnimationController(
                duration: kCardAnimationDuration,
                vsync: this,
              )
            ..repeat(reverse: true),
          curve: Curves.easeIn));
      _cardsAnimationController!.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _goToLogin() async {
    await _rippleAnimationController!.forward();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Login(
          screenHeight: widget.screenHeight,
        ),
      ),
    );
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation!.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController!.forward();
          await _cardsAnimationController!.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController!.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation!.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController!.forward();
          await _cardsAnimationController!.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController!.forward();
        }
        break;
      case 3:
        if (_pageIndicatorAnimation!.status == AnimationStatus.completed) {
          _goToLogin();
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlue,
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(kPaddingL),
                child: Column(
                  children: <Widget>[
                    Header(
                      onSkip: () async => await _goToLogin(),
                    ),
                    Expanded(
                      child: _getPage(),
                    ),
                    AnimatedBuilder(
                      animation: _pageIndicatorAnimation ??
                          AnimationController(
                            vsync: this,
                            duration: kButtonAnimationDuration,
                          ),
                      child: NextPageButton(
                        onPressed: () async => await _nextPage(),
                      ),
                      builder: (BuildContext context, Widget? child) {
                        return OnboardingPageIndicator(
                          currentPage: _currentPage,
                          child: child,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _rippleAnimation ??
                  AnimationController(
                    vsync: this,
                    duration: kRippleAnimationDuration,
                  ),
              builder: (context, child) {
                return Ripple(radius: _rippleAnimation!.value);
              },
            )
          ],
        ));
  }
}
