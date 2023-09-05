import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({Key? key, this.width, this.height, this.CoachUserID})
      : super(key: key);
  final double? width;
  final double? height;
  final double? CoachUserID;

  @override
  Widget build(BuildContext context) {
    String rating = '4.5';
    String adjective = 'Good';
    double intitialStarRating = 0;
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 19, 16, 66),
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IgnorePointer(
                  ignoring: true, // Ignore pointer events on the RatingBar
                  child: RatingBar.builder(
                    itemSize: 20,
                    initialRating: intitialStarRating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    adjective,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 19, 16, 66),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
