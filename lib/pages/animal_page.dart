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
          children: [AnimalXXXStudy()],
        ));
  }
}

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
