import 'package:cinetopia/app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Container(
          width: 90,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.getPosterPath()),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              movie.title,
              style: TextStyle(
                color: Color(0xDDEBEBEB),
                fontSize: 18,
                fontWeight: FontWeight(500),
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Text(
                movie.releaseDate,
                style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
