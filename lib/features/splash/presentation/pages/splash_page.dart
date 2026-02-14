import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/core/utils/extensions/responsive_extensions.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router.dart';
import '../../../../core/utils/assets.dart';
import '../cubit/splash_cubit.dart';
import '../../../../injection_container.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..startSplash(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          context.go(AppRoutes.home);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF), // White 0%
                Color(0xFFEAF7F0), // Light Green 50%
                Color(0xFFE9F2FF), // Light Blue 100%
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Center(
            child: Image.asset(
              AppAssets.logo,
              width: 146.responsive(context),
              height: 148.responsive(context),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
