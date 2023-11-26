import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/View/screens/HomeScreen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({Key? key, this.callback}) : super(key: key);
   final callback;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
 Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
    Container(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(height: 60,),
          Text(
            title,
            style: TextStyle(
              color: Colors.red.shade800,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 24,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subtitle,
              // textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
           buildPage(
               color: Colors.pink.shade200,
               urlImage: 'assets/OnboardImage/store.jpg',
               title: 'Choose Product',
               subtitle: 'You Can Easily Find The Product You Want From Our Various Products!',
           ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/OnboardImage/payment.jpg',
              title: 'Choose a Payment Method',
              subtitle: 'We Have Many Payment Methods Supported!',
            ),
            buildPage(
              color: Colors.pink.shade200,
              urlImage: 'assets/OnboardImage/cart.jpg',
              title: 'Get Your Order',
              subtitle: 'Open The Doors, Your Order is Now Ready For You!',
            ),

          ],
        ),
      ),
      bottomSheet: isLastPage
        ? TextButton(
          style: TextButton.styleFrom(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: ( ) async{

            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
            (context) => HomePage(callback: widget.callback,)));
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Get Started',
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8,),
              Icon(Icons.arrow_forward_outlined,size: 23,),
            ],
          ),)
      : Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: Text("Skip"),),

            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 10,
                  dotColor: Colors.pink.shade100,
                  activeDotColor: Colors.red.shade700,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
                onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                controller.nextPage(duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,);
              },
              child: Text("Next"),),
          ],
        ),
      ),
    );
  }

}
