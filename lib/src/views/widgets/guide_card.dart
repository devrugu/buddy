import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value.floor()
              ? Icons.star
              : index < value
                  ? Icons.star_half
                  : Icons.star_border,
        );
      }),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String name;
  final String location;
  final String bio;
  final int reviews;
  final double rating;
  final String hourlyRate;
  final String image;

  const GuideCard({
    super.key,
    required this.name,
    required this.location,
    required this.bio,
    required this.reviews,
    required this.rating,
    required this.hourlyRate,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 310,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                Text(location, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(bio),
                const SizedBox(height: 8),
                Row(
                  children: [
                    StarDisplay(value: rating),
                    const SizedBox(width: 8),
                    Text('$reviews Reviews'),
                  ],
                ),
                const SizedBox(height: 8),
                Chip(
                  label: Text(hourlyRate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
