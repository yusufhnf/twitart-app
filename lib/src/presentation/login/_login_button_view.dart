part of './login_screen.dart';

class _LoginButtonView extends StatelessWidget {
  const _LoginButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: LoginSocialMediaButton(
            icon: Ionicons.logo_google,
            label: Strings.loginWithGoogle,
            colorButton: Colors.red,
            onPressed: () =>
                context.read<AuthenticationCubit>().signInWithGoogle(),
          ),
        ),
      ],
    );
  }
}
