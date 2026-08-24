  void _handleLogin() {
    String email = _emailController.text.trim().toLowerCase();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // التحقق إذا كنت أنت مالك التطبيق (ضع بريدك السري هنا)
      bool isOwner = (email == "owner@lifepilot.os" || email == "admin");

      if (isOwner) {
        // رسالة ترحيب خاصة بالمالك
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("👑 Owner Access Granted: Welcome Back, Master!"),
            backgroundColor: Colors.tealAccent,
          ),
        );
      }

      // الانتقال للوحة التحكم الرئيسية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainHubScreen(isOwner: isOwner)),
      );
    });
  }
