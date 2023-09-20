import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/router/router.dart';

class AnimalPage extends StatelessWidget {
  const AnimalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.animal,
        child: Column(
          children: [
            CureTweenStudy(),
            // AnimalXXXStudy(),
            // AnimatedBuilderStudy(),
            // XXXTransitionStudy(),
            // SlideTransitionStudy(),
            // TweenSequenceStudy()
          ],
        ));
  }
}

///隐私动画的学习
class AnimalXXXStudy extends HookWidget {
  const AnimalXXXStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final size = useState(50.0);
    final large = useRef(false);

    final updateSize = useCallback(() {
      size.value = large.value ? 250.0 : 100.0;
      large.value = !large.value;
    }, []);

    return GestureDetector(
      onTap: () => updateSize(),
      child: ColoredBox(
        color: Colors.amberAccent,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: FlutterLogo(size: size.value),
        ),
      ),
    );
  }
}

///AnimatedBuilder
class AnimatedBuilderStudy extends HookWidget {
  const AnimatedBuilderStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final animaC = useAnimationController(
        duration: const Duration(seconds: 1), lowerBound: 0.3)
      ..repeat();
    return Column(
      children: [
        AnimatedBuilder(
          animation: CurveTween(curve: Curves.linear).animate(animaC),
          builder: (BuildContext context, Widget? child) {
            final width = 200 * animaC.value;
            return Container(
              color: Colors.red,
              width: width,
              height: width,
              child: FlutterLogo(size: width),
            );
          },
        )
      ],
    );
  }
}

///显示动画
class XXXTransitionStudy extends HookWidget {
  const XXXTransitionStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final animaC = useAnimationController(duration: const Duration(seconds: 3))
      ..repeat();
    final bigLogo = useRef(150.0);
    final smallLogo = useRef(100.0);
    final biggest = useRef(const Size(500, 300.0));
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: biggest.value.width,
          height: biggest.value.height,
        ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromSize(
              Rect.fromLTWH(0, 0, smallLogo.value, smallLogo.value),
              biggest.value,
            ),
            end: RelativeRect.fromSize(
              Rect.fromLTWH(
                  biggest.value.width - bigLogo.value,
                  biggest.value.height - bigLogo.value,
                  bigLogo.value,
                  bigLogo.value),
              biggest.value,
            ),
          ).animate(CurvedAnimation(
            parent: animaC,
            curve: Curves.elasticInOut,
          )),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}

class SlideTransitionStudy extends HookWidget {
  const SlideTransitionStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final animaC = useAnimationController(duration: const Duration(seconds: 3));
    final tw = useRef(Tween(
        begin: const Offset(
          -1,
          -1,
        ),
        end: Offset.zero));

    final tw2 = useRef(Tween(begin: 0.0, end: 3.0));
    return MouseRegion(
      onEnter: (_) {
        animaC.forward();
      },
      onExit: (_) {
        animaC.reverse();
      },
      child: Stack(
        children: [
          Container(
            color: Colors.yellow,
            width: 300,
            height: 300,
          ),
          ClipRect(
            child: SlideTransition(
              position: tw.value.animate(animaC),
              child: RotationTransition(
                turns: tw2.value.animate(animaC),
                child: Container(
                  color: Colors.green,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TweenSequenceStudy extends HookWidget {
  const TweenSequenceStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final animalC = useAnimationController(duration: const Duration(seconds: 3))
      ..repeat();
    final Animation<double> animation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 10, end: 100)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(100),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 100, end: 50)
              .chain(CurveTween(curve: Curves.ease)),
          weight: 40.0,
        ),
      ],
    ).animate(animalC);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          margin: EdgeInsets.only(left: animation.value),
          child: const FlutterLogo(),
        );
      },
    );
  }
}

class CureTweenStudy extends HookWidget {
  const CureTweenStudy({super.key});

  @override
  Widget build(BuildContext context) {
    final animalC = useAnimationController(duration: const Duration(seconds: 3))
      ..repeat();

    final tw = useRef(Tween(begin: 50.0, end: 300.0)
        .chain(CurveTween(curve: const Interval(0.3, 0.7)))
        .animate(animalC));

    return AnimatedBuilder(
      animation: tw.value,
      builder: (BuildContext context, Widget? child) {
        return Container(
          color: Colors.red,
          width: tw.value.value,
          height: tw.value.value,
        );
      },
    );
  }
}
