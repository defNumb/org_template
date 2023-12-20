import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_template/pages/page_container.dart';

import '../blocs/blocs/authentication/authentication_bloc.dart';

import 'authentication/sign_in.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        // initialize the authentication service with event
        context.read<AuthenticationBloc>().add(
              AuthenticationRegisterRequested(),
            );
        // print the state
        return BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              // if the user is authenticated, navigate to the page container
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageContainer(),
                ),
              );
            } else if (state.status == AuthenticationStatus.unauthenticated ||
                state.status == AuthenticationStatus.unknown) {
              // if the user is not authenticated, navigate to the sign in page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            }
          },
          builder: (context, state) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
